class ProfilesController < ApplicationController

  # IMPORTANT NOTE: the ID used for the Profiles controller is the same ID from the Participants table

  before_action :set_profile
  before_action :logged_in_user
  before_action :correct_participant_user

  def edit
  end

  def show
  end

  def update

    params_to_update = profile_params

    # Remove any previous pictures, if a new one was selected
    if params[:participant][:picture].present?
      @participant.picture.purge
    end

    # Add the Social Media Profile params
    social_media_profiles_attributes = Array.new
    SocialMediaType.all.order('name ASC').each do |t|

      # Get the text box value (handle)
      handle = params["smt_" + t.id.to_s]

      # Check if the user already has a value set for this Type
      profile = @participant.social_media_profiles.find { |smp| smp.social_media_type_id === t.id }

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
    @survey_questions.each do |question_id, question|

      # Get the text box value (answer)
      form_answer = params["sqa_" + question_id.to_s]

      # Check if the user already has a value set
      existing_answer = @participant.survey_answers.find { |sa| sa.survey_question_id === question_id }

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

    # Update all attributes
    if @participant.update_attributes(params_to_update)
      flash[:success] = "Profile updated"
      redirect_to profile_path(@participant)
    else
      render 'edit'
    end
  end

  private

    # Set all of the variables that are used in the views
    def set_profile
      @participant = Participant.find(params[:id])
      @picture_url = helpers.get_participant_picture_url(@participant.id)

      # Social media profiles
      @social_media_profiles = Hash.new
      SocialMediaType.all.order('name ASC').each do |t|
        profile = @participant.social_media_profiles.find { |smp| smp.social_media_type_id === t.id }
        if profile
          @social_media_profiles[t.id] = profile.handle
        else
          @social_media_profiles[t.id] = ""
        end
      end

      # Survey questions and answers
      @survey_questions = Hash.new
      
      if @participant.is_candidate
        survey_type = SurveyType.find_by(name: "Candidate")
      else 
        survey_type = SurveyType.find_by(name: "Party")
      end

      election = @participant.elections.find_by(active: true)
      if election
        survey = election.surveys.find_by(survey_type_id: survey_type.id)
        if survey
          SurveyQuestion.where(survey_id: survey.id).order(order: :asc).each do |q|
            @survey_questions[q.id] = q.question
          end
        end
      end
    end

    def profile_params
      params.require(:participant).permit(:picture, :name, :email, :phone, :website, :biography, address_attributes:[:street, :city, :province_id, :postal_code])
    end

    # Confirms the correct user attached to the participant, or if the user is an Admin
    def correct_participant_user
      @participant = Participant.find(params[:id])
      @user = User.find(@participant.user_id)
      redirect_to(root_url) unless (current_user?(@user) || is_admin_user?)
    end
end
