class ContentLocationsController < ApplicationController

  before_action :admin_user
  before_action :set_content_location, only: [:show, :edit, :update, :destroy]

  def index
    @content_locations = ContentLocation.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @content_location = ContentLocation.new(content_location_params)

    if @content_location.save
      flash[:success] = "Content Location created successfully"
      redirect_to content_locations_url
    else
      render 'new'
    end
  end

  def destroy
    if @content_location.destroy
      flash[:success] = "Content Location deleted"
      redirect_to content_locations_url
    else
      flash[:danger] = "Deletion failed! This Content Location is being used by another object and cannot be deleted."
      redirect_to @content_location
    end
  end

  def edit
  end

  def new
    @content_location = ContentLocation.new
  end

  def show
  end

  def update
    if @content_location.update_attributes(content_location_params)
      flash[:success] = "Content Location updated"
      redirect_to @content_location
    else
      render 'edit'
    end
  end

  private

    def set_content_location
      @content_location = ContentLocation.find(params[:id])
    end

    def content_location_params
      params.require(:content_location).permit(:name)
    end
end