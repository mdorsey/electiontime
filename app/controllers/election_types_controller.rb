class ElectionTypesController < ApplicationController

  before_action :admin_user
  before_action :set_election_type, only: [:show, :edit, :update, :destroy]

  def index
    @election_types = ElectionType.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end

  def create
    @election_type = ElectionType.new(election_type_params)

    if @election_type.save
      flash[:success] = "Election Type created successfully"
      redirect_to election_types_url
    else
      render 'new'
    end
  end

  def destroy
    if @election_type.destroy
      flash[:success] = "Election Type deleted"
      redirect_to election_types_url
    else
      flash[:danger] = "Deletion failed! This Election Type is being used by another object and cannot be deleted."
      redirect_to @election_type
    end
  end

  def edit
  end

  def new
    @election_type = ElectionType.new
  end

  def show
  end

  def update
    if @election_type.update_attributes(election_type_params)
      flash[:success] = "Election Type updated"
      redirect_to @election_type
    else
      render 'edit'
    end
  end

  private

    def set_election_type
      @election_type = ElectionType.find(params[:id])
    end

    def election_type_params
      params.require(:election_type).permit(:name)
    end
end
