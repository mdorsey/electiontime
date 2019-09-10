class DistrictsController < ApplicationController

  before_action :admin_user
  before_action :set_district, only: [:show, :edit, :update, :destroy]

  def index
    @districts = District.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @district = District.new(district_params)

    if @district.save
      flash[:info] = "District created successfully"
      redirect_to districts_url
    else
      render 'new'
    end
  end

  def destroy
    if @district.destroy
      flash[:success] = "District deleted"
      redirect_to districts_url
    else
      flash[:danger] = "Deletion failed! This District is being used by another object and cannot be deleted."
      redirect_to @district
    end
  end

  def edit
  end

  def new
    @district = District.new
  end

  def show
  end

  def update
    if @district.update_attributes(district_params)
      flash[:success] = "District updated"
      redirect_to @district
    else
      render 'edit'
    end
  end

  private

    def set_district
      @district = District.find(params[:id])
    end

    def district_params
      params.require(:district).permit(:name, :election_type_id, :jurisdiction_id)
    end
end
