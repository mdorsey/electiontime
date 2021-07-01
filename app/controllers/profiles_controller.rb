class ProfilesController < ApplicationController

  # IMPORTANT NOTE: the ID used for the Profiles controller is the same ID from the Participants table

  before_action :logged_in_user
  before_action :correct_participant_user, only: [:show, :edit, :update]
  before_action :set_profile, only: [:show, :edit, :update]

  # Breadcrumbs
  breadcrumb 'Public Profiles', :profiles_path
  breadcrumb -> { @participant.participant_name_for_display }, -> { profile_path(@participant) }, only: [:edit, :show]

  def index
    @profiles = current_user.participants_in_future_elections
  end

  def edit
  end

  def show
  end

  def update
    if @participant.update_profile(params, profile_params, @survey_questions)

      Log.create(user_id: current_user.id, log_type_id: LogType.find_by(name: "Public Profile").id, message: "User updated the Public Profile of " + @participant.name)

      flash[:success] = "Profile updated"
      redirect_to profile_path(@participant)
    else
      render 'edit'
    end
  end

  private

    def set_profile
      @participant = Participant.find(params[:id])

      # Social media profiles
      @social_media_profiles = Hash.new
      SocialMediaType.all.order(name: :asc).each do |t|
        profile = @participant.social_media_profiles.find { |smp| smp.social_media_type_id === t.id }
        if profile
          @social_media_profiles[t.id] = profile.handle
        else
          @social_media_profiles[t.id] = ""
        end
      end

      # Survey questions and answers
      @survey_questions = Hash.new
      election = @participant.elections.find_by(active: true)
      if election
        if @participant.is_candidate
          survey_type = SurveyType.find_by(name: "Candidate")
        else 
          survey_type = SurveyType.find_by(name: "Party")
        end
        survey = election.surveys.find_by(survey_type_id: survey_type.id)
        if survey
          SurveyQuestion.where(survey_id: survey.id).order(order: :asc).each do |q|
            @survey_questions[q.id] = q.question
          end
        end
      end
    end

    def profile_params
      params.require(:participant).permit(:picture, :name, :email, :phone, :address, :website, :biography)
    end

    # Confirms the correct user is attached to the participant in a future election, or the user is an Admin
    def correct_participant_user
      @participant = Participant.find(params[:id])
      @user = User.find(@participant.user_id)
      redirect_to(root_url) unless ((current_user?(@user) && @participant.is_participant_in_future_election?) || is_admin_user?)
    end
end
