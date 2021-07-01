class Participant < ApplicationRecord

  belongs_to :user
  belongs_to :party
  belongs_to :district, optional: true
  belongs_to :office, optional: true
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

  # Returns true if the participant is in an active future election, false otherwise
  def is_participant_in_future_election?
    Election.joins(:participants).where("participants.id = ? AND elections.active = true AND election_date >= ?", self.id, Time.now.utc.midnight).any?
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

        row_number = (i + 2).to_s

        c_or_p = row[0]
        party_leader = row[1]
        incumbent = row[2]
        first_name = row[3]
        last_name = row[4]
        email = row[5]
        participant_name = row[6]
        party_name = row[7]
        office_name = row[8]
        district_name = row[9]

        if (c_or_p != "C" && c_or_p != "P")
          errors << "Row " + row_number + " has an invalid entry for Candidate (C) or Party (P)"
        end

        if (party_leader != "Y" && party_leader != "N")
          errors << "Row " + row_number + " has an invalid entry for Party Leader (Y or N)"
        end

        if (incumbent != "Y" && incumbent != "N")
          errors << "Row " + row_number + " has an invalid entry for Incumbent (Y or N)"
        end

        # Check that the owner can be ceated successfully (if it doesn't already exist)
        if !User.find_by(email: email)
          if !User.new(first_name: first_name, 
                        last_name: last_name, 
                        email: email, 
                        user_type_id: temp_user_type_id, 
                        password: temp_random_password, 
                        password_confirmation: temp_random_password, 
                        activated: true, 
                        activated_at: Time.zone.now).valid?
            errors << "Row " + row_number + " has an invalid Owner: " + email
          end
        end

        if participant_name.blank?
          errors << "Row " + row_number + " has a blank Participant Name"
        end

        if !Party.find_by(name: party_name)
          errors << "Row " + row_number + " has a party that doesn't exist: " + party_name
        end

        if (c_or_p === "C")
          if office_name.blank?
            errors << "Row " + row_number + " has a blank office. A candidate must have an office"
          else
            office = election.offices.find_by(name: office_name)
            if office
              if office.districts.empty?
                if district_name.present?
                  errors << "Row " + row_number + " has a district for an office that shouldn't have districts"
                end
              else
                if district_name.blank?
                  errors << "Row " + row_number + " has a blank district for an office that should have districts"
                elsif !office.districts.exists?(name: district_name)
                  errors << "Row " + row_number + " has a district that doesn't belong to the office: " + district_name  
                end
              end
            else
              errors << "Row " + row_number + " has an office that doesn't belong to the election: " + office_name
            end
          end
        end

        if (c_or_p === "P")
          if (party_leader === "Y")
            errors << "Row " + row_number + " is a party leader. A party cannot be its own party leader"
          end

          if office_name.present?
            errors << "Row " + row_number + " has an office. It should be blank when the participant is a Party"
          end

          if district_name.present?
            errors << "Row " + row_number + " has a district. It should be blank when the participant is a Party"
          end
        end
      end
    end

    if errors.empty?
      if overwrite == "1"
        # Remove all previously existing participants for this election
        election.participants.destroy_all
      end

      # Create each owner and participant, then add participants to the election
      CSV.foreach(file.path, headers: true) do |row|

        c_or_p = row[0]
        party_leader = row[1]
        incumbent = row[2]
        first_name = row[3]
        last_name = row[4]
        email = row[5]
        participant_name = row[6]
        party_name = row[7]
        office_name = row[8]
        district_name = row[9]

        if (c_or_p === "C")
          is_candidate = true
          user_type_id = UserType.find_by(name: 'Candidate').id
        else
          is_candidate = false
          user_type_id = UserType.find_by(name: 'Party Representative').id
        end

        if (party_leader === "Y")
          is_party_leader = true
        else
          is_party_leader = false
        end

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
          # Create the participant candidate
          office = election.offices.find_by(name: office_name)

          if district_name.present?
            district_id = office.districts.find_by(name: district_name).id
          else
            district_id = nil
          end

          if election.participants.create(user_id: owner.id,
                                          name: participant_name,
                                          party_id: Party.find_by(name: party_name).id,
                                          office_id: office.id,
                                          district_id: district_id,
                                          is_candidate: is_candidate,
                                          is_incumbent: is_incumbent,
                                          is_party_leader: is_party_leader).valid?
            new_participants_count += 1
          end

        else
          # Create the participant party
          if election.participants.create(user_id: owner.id,
                                          name: participant_name,
                                          party_id: Party.find_by(name: party_name).id,
                                          is_candidate: is_candidate,
                                          is_incumbent: is_incumbent,
                                          is_party_leader: is_party_leader).valid?
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
