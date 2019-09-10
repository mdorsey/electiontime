class JurisdictionsController < ApplicationController

  before_action :admin_user
  before_action :set_jurisdiction, only: [:show, :edit, :update, :destroy]

  def index
    @jurisdictions = Jurisdiction.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @jurisdiction = Jurisdiction.new(jurisdiction_params)

    if @jurisdiction.save
      flash[:info] = "Jurisdiction created successfully"
      redirect_to jurisdictions_url
    else
      render 'new'
    end
  end

  def destroy
    if @jurisdiction.destroy
      flash[:success] = "Jurisdiction deleted"
      redirect_to jurisdictions_url
    else
      flash[:danger] = "Deletion failed! This Jurisdiction is being used by another object and cannot be deleted."
      redirect_to @jurisdiction
    end
  end

  def edit
  end

  def new
    @jurisdiction = Jurisdiction.new
  end

  def show
  end

  def update
    if @jurisdiction.update_attributes(jurisdiction_params)
      flash[:success] = "Jurisdiction updated"
      redirect_to @jurisdiction
    else
      render 'edit'
    end
  end

  private

    def set_jurisdiction
      @jurisdiction = Jurisdiction.find(params[:id])
    end

    def jurisdiction_params
      params.require(:jurisdiction).permit(:name)
    end
end
