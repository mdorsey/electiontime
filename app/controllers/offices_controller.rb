class OfficesController < ApplicationController

  before_action :admin_user
  before_action :set_office, only: [:show, :edit, :update, :destroy]

  def index
    @offices = Office.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end

  def create
    @office = Office.new(office_params)

    if @office.save
      flash[:success] = "Office created successfully"
      redirect_to offices_url
    else
      render 'new'
    end
  end

  def destroy
    if @office.destroy
      flash[:success] = "Office deleted"
      redirect_to offices_url
    else
      flash[:danger] = "Deletion failed! This Office is being used by another object and cannot be deleted."
      redirect_to @office
    end
  end

  def edit
  end

  def new
    @office = Office.new
  end

  def show
  end

  def update
    if @office.update_attributes(office_params)
      flash[:success] = "Office updated"
      redirect_to @office
    else
      render 'edit'
    end
  end

  private

    def set_office
      @office = Office.find(params[:id])
    end

    def office_params
      params.require(:office).permit(:name, :order, :election_id)
    end
end
