class SocialMediaTypesController < ApplicationController

  before_action :admin_user
  before_action :set_social_media_type, only: [:show, :edit, :update, :destroy]

  def index
    @social_media_types = SocialMediaType.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end
  
  def create
    @social_media_type = SocialMediaType.new(social_media_type_params)

    if @social_media_type.save
      flash[:success] = "Social Media Type created successfully"
      redirect_to social_media_types_url
    else
      render 'new'
    end
  end

  def destroy
    if @social_media_type.destroy
      flash[:success] = "Social Media Type deleted"
      redirect_to social_media_types_url
    else
      flash[:danger] = "Deletion failed! This Social Media Type is being used by another object and cannot be deleted."
      redirect_to @social_media_type
    end
  end

  def edit
  end

  def new
    @social_media_type = SocialMediaType.new
  end

  def show
  end

  def update
    if @social_media_type.update_attributes(social_media_type_params)
      flash[:success] = "Social Media Type updated"
      redirect_to @social_media_type
    else
      render 'edit'
    end
  end

  private

    def set_social_media_type
      @social_media_type = SocialMediaType.find(params[:id])
    end

    def social_media_type_params
      params.require(:social_media_type).permit(:name, :website)
    end
end
