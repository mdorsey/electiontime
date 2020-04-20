class Participant < ApplicationRecord

  belongs_to :user
  belongs_to :party
  belongs_to :address, optional: true, dependent: :destroy
  belongs_to :district, optional: true
  belongs_to :leader_participant, class_name: "Participant", optional: true
  has_and_belongs_to_many :elections
  has_many :social_media_profiles
  has_many :survey_answers
  has_one_attached :picture
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :social_media_profiles
  accepts_nested_attributes_for :survey_answers
  
  validates(:user, presence: true)
  validates(:party, presence: true)
  validates(:name, length: { maximum: 255 }, presence: true)
  validates(:email, length: { maximum: 255 })
  validates(:website, length: { maximum: 255 })
  validates(:phone, length: { maximum: 255 })
  validates(:biography, length: { maximum: 5000, too_long: "%{count} characters is the maximum allowed" })

  before_destroy :allow_destroy

  def self.search(search_text)
    if search_text
      where('name LIKE ? OR email LIKE ?', "%#{search_text}%", "%#{search_text}%")
    else
      unscoped
    end
  end

  def participant_name_for_display
    if self.is_candidate
      "#{name} (#{party.name})"
    else
      "#{name}"
    end
  end

  def update_profile(raw_params, permitted_params, survey_questions)

    params_to_update = permitted_params

    # Add the Social Media Profile params
    social_media_profiles_attributes = Array.new
    SocialMediaType.all.order(name: :asc).each do |t|

      # Get the text box value (handle)
      handle = raw_params["smt_" + t.id.to_s]

      # Check if the user already has a value set for this Type
      profile = self.social_media_profiles.find { |smp| smp.social_media_type_id === t.id }

      if profile && !handle.empty?
        # Update the existing value
        social_media_profiles_attributes << { id: profile.id, handle: handle, social_media_type_id: t.id }

      elsif !handle.empty?
        # Create a new value since one doesn't already exist
        social_media_profiles_attributes << { handle: handle, social_media_type_id: t.id }

      elsif profile
        # Delete the existing value since the handle was removed
        @smp_to_delete = SocialMediaProfile.find(profile.id)
        @smp_to_delete.destroy
      end
    end

    if social_media_profiles_attributes.any?
      params_to_update[:social_media_profiles_attributes] = social_media_profiles_attributes
    end

    # Add the Survey Answer params
    survey_answers_attributes = Array.new
    survey_questions.each do |question_id, question|

      # Get the text box value (answer)
      form_answer = raw_params["sqa_" + question_id.to_s]

      # Check if the user already has a value set
      existing_answer = self.survey_answers.find { |sa| sa.survey_question_id === question_id }

      if existing_answer && !form_answer.empty?
        # Update the existing value
        survey_answers_attributes << { id: existing_answer.id, survey_question_id: question_id, answer: form_answer }

      elsif !form_answer.empty?
        # Create a new value since one doesn't already exist
        survey_answers_attributes << { survey_question_id: question_id, answer: form_answer }

      elsif existing_answer
        # Delete the existing value since the handle was removed
        @sa_to_delete = SurveyAnswer.find(existing_answer.id)
        @sa_to_delete.destroy
      end
    end

    if survey_answers_attributes.any?
      params_to_update[:survey_answers_attributes] = survey_answers_attributes
    end

    # Update the participant and return the result
    return self.update_attributes(params_to_update)
  end

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless (social_media_profiles.empty? && survey_answers.empty?)
        throw :abort
      end
    end
end
