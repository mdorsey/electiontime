class SocialMediaProfilesController < ApplicationController

  before_action :admin_user
  before_action :set_social_media_profile, only: [:show, :edit, :update, :destroy]

  def index
    @social_media_profiles = SocialMediaProfile.paginate(page: params[:page]).order('handle ASC')
  end

  def create
    @social_media_profile = SocialMediaProfile.new(social_media_profile_params)

    if @social_media_profile.save
      flash[:success] = "Social Media Profile created successfully"
      redirect_to social_media_profiles_url
    else
      render 'new'
    end
  end

  def destroy
    if @social_media_profile.destroy
      flash[:success] = "Social Media Profile deleted"
      redirect_to social_media_profiles_url
    else
      flash[:danger] = "Deletion failed! This Social Media Profile is being used by another object and cannot be deleted."
      redirect_to @social_media_profile
    end
  end

  def edit
  end

  def new
    @social_media_profile = SocialMediaProfile.new
  end

  def show
  end

  def update
    if @social_media_profile.update_attributes(social_media_profile_params)
      flash[:success] = "Social Media Profile updated"
      redirect_to @social_media_profile
    else
      render 'edit'
    end
  end

  private

    def set_social_media_profile
      @social_media_profile = SocialMediaProfile.find(params[:id])
    end

    def social_media_profile_params
      params.require(:social_media_profile).permit(:handle, :participant_id, :social_media_type_id)
    end
end
