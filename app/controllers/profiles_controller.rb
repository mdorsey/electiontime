class ProfilesController < ApplicationController

  # The ID used for the Profiles controller is actually the ID from the Participants table

  before_action :set_profile
  before_action :logged_in_user
  before_action :correct_participant_user

  def edit
    @social_media_profiles = Hash.new

    SocialMediaType.all.order('name ASC').each do |s|
      profile = @participant.social_media_profiles.find { |smp| smp.social_media_type_id === s.id }

      if profile
        @social_media_profiles[s.name] = profile.handle
      else
        @social_media_profiles[s.name] = ""
      end
    end
  end

  def show
    @picture_url = helpers.get_participant_picture_url(@participant.id)
  end

  def update
    # Remove any previous pictures, if a new one was selected
    if params[:participant][:picture].present?
      @participant.picture.purge
    end

    if @participant.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to profile_path(@participant)
    else
      render 'edit'
    end
  end

  private

    def set_profile
      @participant = Participant.find(params[:id])
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
