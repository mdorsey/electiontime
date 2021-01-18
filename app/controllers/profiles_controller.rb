class ProfilesController < ApplicationController

  # IMPORTANT NOTE: the ID used for the Profiles controller is the same ID from the Participants table

  before_action :logged_in_user
  before_action :correct_participant_user, only: [:show, :edit, :update]
  before_action :set_profile, only: [:show, :edit, :update]

  # Breadcrumbs
  breadcrumb 'Public Profiles', :profiles_path
  breadcrumb -> { @participant.participant_name_for_display }, -> { profile_path(@participant) }, only: [:edit, :show]

  def index
    @profiles = Participant.where(user_id: current_user.id).order(name: :asc)
  end

  def edit
  end

  def show
  end

  def update
    # Remove any previous pictures, if a new one was selected
    if params[:participant][:picture].present?
      @participant.picture.purge
    end

    if @participant.update_profile(params, profile_params, @survey_questions)
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
      params.require(:participant).permit(:picture, :name, :email, :phone, :website, :biography, address_attributes:[:street, :city, :province_id, :postal_code])
    end

    # Confirms the correct user attached to the participant, or if the user is an Admin
    def correct_participant_user
      @participant = Participant.find(params[:id])
      @user = User.find(@participant.user_id)
      redirect_to(root_url) unless (current_user?(@user) || is_admin_user?)
    end
end
