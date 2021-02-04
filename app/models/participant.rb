class Participant < ApplicationRecord

  belongs_to :user
  belongs_to :party
  belongs_to :district, optional: true
  belongs_to :leader_participant, class_name: "Participant", optional: true
  has_and_belongs_to_many :elections
  has_many :social_media_profiles
  has_many :survey_answers
  has_one_attached :picture
  accepts_nested_attributes_for :social_media_profiles
  accepts_nested_attributes_for :survey_answers
  
  validates(:user, presence: true)
  validates(:party, presence: true)
  validates(:name, length: { maximum: 255 }, presence: true)
  validates(:email, length: { maximum: 255 })
  validates(:website, length: { maximum: 255 })
  validates(:address, length: { maximum: 255 })
  validates(:phone, length: { maximum: 255 })
  validate :biography_max_character_length

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

    # Remove the existing picture, if a new one was selected
    if raw_params[:participant][:picture].present?
      self.picture.purge
    end

    # Add the Social Media Profile params
    social_media_profiles_attributes = Array.new
    SocialMediaType.all.order(name: :asc).each do |t|

      # Get the text box value (handle)
      handle = raw_params["smt_" + t.id.to_s]

      # Check if the user already has a value set for this Type
      profile = self.social_media_profiles.find { |smp| smp.social_media_type_id === t.id }

      if profile && handle.present?
        # Update the existing value
        social_media_profiles_attributes << { id: profile.id, handle: handle, social_media_type_id: t.id }

      elsif handle.present?
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

      if existing_answer && form_answer.present?
        # Update the existing value
        survey_answers_attributes << { id: existing_answer.id, survey_question_id: question_id, answer: form_answer }

      elsif form_answer.present?
        # Create a new value since one doesn't already exist
        survey_answers_attributes << { survey_question_id: question_id, answer: form_answer }

      elsif existing_answer
        # Delete the existing value since the answer was removed
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
  def self.import(file, election_id, data_source, overwrite)

    new_users_count = 0
    new_participants_count = 0
    errors = Array.new
    election = Election.find(election_id)
    temp_random_password = User.random_password

    if (data_source === "Candidates")
      is_candidate = true
      user_type_id = UserType.find_by(name: 'Candidate').id
    else
      is_candidate = false
      user_type_id = UserType.find_by(name: 'Party Representative').id
    end

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
        incumbent = row[5]

        row_number = (i + 2).to_s

        # Check that the owner can be ceated successfully (if it doesn't already exist)
        if !User.find_by(email: email)
          if !User.new(first_name: first_name, 
                        last_name: last_name, 
                        email: email, 
                        user_type_id: user_type_id, 
                        password: temp_random_password, 
                        password_confirmation: temp_random_password, 
                        activated: true, 
                        activated_at: Time.zone.now).valid?
            errors << "Row " + row_number + " has an invalid Owner: " + email
          end
        end

        # Check that the party exists
        if !Party.find_by(name: party_name)
          errors << "Row " + row_number + " has a Party that doesn't exist: " + party_name
        end

        if is_candidate
          district_name = row[6]
          
          # Check that the district exists and is part of this election
          district = District.find_by(name: district_name)
          if district
            if !election.districts.exists?(id: district.id)
              errors << "Row " + row_number + " has a District that exists but doesn't belong to this election: " + district_name
            end
          else
            errors << "Row " + row_number + " has a District that doesn't exist: " + district_name
          end

        else
          party_leader_participant_name = row[6]

          # Check that the participant exists
          if !Participant.find_by(name: party_leader_participant_name)
            errors << "Row " + row_number + " has an invalid Party Leader Participant Name: " + party_leader_participant_name
          end
        end

        if participant_name.blank?
          errors << "Row " + row_number + " has a blank Participant Name"
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

      # Create each owner and participant, then add participants to the election
      CSV.foreach(file.path, headers: true) do |row|

        first_name = row[0]
        last_name = row[1]
        email = row[2]
        participant_name = row[3]
        party_name = row[4]
        incumbent = row[5]

        if (incumbent === "Y")
          is_incumbent = true
        else
          is_incumbent = false
        end

        real_random_password = User.random_password

        # Find the owner or create a new one
        owner = User.find_or_create_by(email: email) do |u|
          u.first_name = first_name
          u.last_name = last_name
          u.user_type_id = user_type_id
          u.password = real_random_password
          u.password_confirmation = real_random_password
          u.activated = true
          u.activated_at = Time.zone.now

          new_users_count += 1
        end

        if is_candidate
          district_name = row[6]

          # Create the participant candidate
          if election.participants.create(user_id: owner.id,
                                          name: participant_name,
                                          party_id: Party.find_by(name: party_name).id,
                                          district_id: District.find_by(name: district_name).id,
                                          is_candidate: is_candidate,
                                          is_incumbent: is_incumbent).valid?
            new_participants_count += 1
          end

        else
          party_leader_participant_name = row[6]

          # Create the participant party
          if election.participants.create(user_id: owner.id,
                                          name: participant_name,
                                          party_id: Party.find_by(name: party_name).id,
                                          leader_participant_id: Participant.find_by(name: party_leader_participant_name).id,
                                          is_candidate: is_candidate,
                                          is_incumbent: is_incumbent).valid?
            new_participants_count += 1
          end
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

    def biography_max_character_length
      system_setting = SystemSetting.find_by(name: "biography_max_character_length")

      if system_setting
        max_length = system_setting.setting.to_i
      else
        # Default setting
        max_length = 1000
      end

      if biography.present? && biography.length > max_length
        errors.add(:biography, "must be less than or equal to " + max_length.to_s + " characters")
      end
    end
end
