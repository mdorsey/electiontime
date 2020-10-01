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

  def participant_name_for_display(name_only = false)
    if name_only || !self.is_candidate
      "#{name}"
    else
      "#{name} (#{party.name})"
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

  # Bulk upload of participants into an election
  def self.import(file, election_id, overwrite)

    new_users_count = 0
    new_participants_count = 0
    errors = Array.new
    election = Election.find(election_id)
    temp_random_password = User.random_password
    temp_user_type_id = UserType.find_by(name: 'Candidate').id

    # Verify the file type
    if file.content_type != "text/csv"
      errors << "File is of type '" + file.content_type + "'. It must be a CSV."
    else

      # Error checking
      CSV.foreach(file.path, headers: true).with_index do |row, i|

        first_name = row[0]
        last_name = row[1]
        email = row[2]
        participant_name = row[3]
        party_name = row[4]
        district_name = row[5]
        candidate_or_party = row[6]
        incumbent = row[7]

        row_number = (i + 1).to_s

        # Check that the user can be ceated successfully (if it doesn't already exist)
        if !User.find_by(email: email)
          if !User.new(first_name: first_name, 
                        last_name: last_name, 
                        email: email, 
                        user_type_id: temp_user_type_id, 
                        password: temp_random_password, 
                        password_confirmation: temp_random_password, 
                        activated: true, 
                        activated_at: Time.zone.now).valid?
            errors << "Row " + row_number + " has an invalid User: " + email
          end
        end

        # Check that the party exists
        if !Party.find_by(name: party_name)
          errors << "Row " + row_number + " has a Party that doesn't exist: " + party_name
        end

        # Check that the district exists and is part of this election
        district = District.find_by(name: district_name)
        if district
          if !election.districts.exists?(id: district.id)
            errors << "Row " + row_number + " has a District that doesn't belong to the election: " + district_name
          end
        else
          errors << "Row " + row_number + " has a District that doesn't exist: " + district_name
        end

        # Check the participant fields
        if participant_name.blank?
          errors << "Row " + row_number + " has a blank Participant Name"
        end

        if (candidate_or_party != "Candidate" && candidate_or_party != "Party")
          errors << "Row " + row_number + " has an invalid entry for Candidate or Party"
        end

        if (incumbent != "Y" && incumbent != "N")
          errors << "Row " + row_number + " has an invalid entry for Incumbent"
        end
      end
    end

    if errors.empty?
      if overwrite == "1"
        # Remove all previously existing participants for this election
        election.participants.delete_all
      end

      # Create each user and participant, then add participants to the election
      CSV.foreach(file.path, headers: true) do |row|

        first_name = row[0]
        last_name = row[1]
        email = row[2]
        participant_name = row[3]
        party_name = row[4]
        district_name = row[5]
        candidate_or_party = row[6]
        incumbent = row[7]

        if (candidate_or_party === "Candidate")
          user_type_id = UserType.find_by(name: 'Candidate').id
          is_candidate = true
        else
          user_type_id = UserType.find_by(name: 'Party Representative').id
          is_candidate = false
        end

        if (incumbent === "Y")
          is_incumbent = true
        else
          is_incumbent = false
        end

        real_random_password = User.random_password

        # Find the user or create a new one
        user = User.find_or_create_by(email: email) do |u|
          u.first_name = first_name
          u.last_name = last_name
          u.user_type_id = user_type_id
          u.password = real_random_password
          u.password_confirmation = real_random_password
          u.activated = true
          u.activated_at = Time.zone.now

          new_users_count += 1
        end
    
        if election.participants.create(user_id: user.id,
                                        name: participant_name,
                                        party_id: Party.find_by(name: party_name).id,
                                        district_id: District.find_by(name: district_name).id,
                                        is_candidate: is_candidate,
                                        is_incumbent: is_incumbent).valid?
          new_participants_count += 1
        end
      end
    end

    return [errors, new_users_count, new_participants_count]
  end

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless (social_media_profiles.empty? && survey_answers.empty?)
        throw :abort
      end
    end
end
