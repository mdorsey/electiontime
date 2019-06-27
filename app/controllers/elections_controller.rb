class ElectionsController < ApplicationController

  before_action :admin_user
  before_action :set_election, only: [:show, :edit, :update, :destroy]

  def index
    @elections = Election.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @election = Election.new(election_params)

    if @election.save
      flash[:info] = "Election created successfully"
      redirect_to elections_url
    else
      render 'new'
    end
  end

  def destroy
    @election.destroy
    flash[:success] = "Election deleted"
    redirect_to elections_url
  end

  def edit
  end

  def new
    @election = Election.new
  end

  def show
  end

  def update
    if @election.update_attributes(election_params)
      flash[:success] = "Election updated"
      redirect_to @election
    else
      render 'edit'
    end
  end

  private

    def set_election
      @election = Election.find(params[:id])
    end

    def election_params
      params.require(:election).permit(:name, :election_date, :election_type_id, :jurisdiction_id, :active)
    end
end
