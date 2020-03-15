class ElectionsController < ApplicationController

  before_action :admin_user
  before_action :set_election, only: [:show, :edit, :update, :destroy]

  def index
    @elections = Election.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end

  def create
    @election = Election.new(election_params)

    if @election.save
      flash[:success] = "Election created successfully"
      redirect_to elections_url
    else
      render 'new'
    end
  end

  def destroy
    if @election.destroy
      flash[:success] = "Election deleted"
      redirect_to elections_url
    else
      flash[:danger] = "Deletion failed! This Election is being used by another object and cannot be deleted."
      redirect_to @election
    end
  end

  def edit
    # Format the election date
    @election.election_date = @election.election_date.strftime("%d/%m/%Y")
  end

  def new
    @election = Election.new
  end

  def show
  end

  def update

    if @election.update_attributes(election_params)

      if (!election_params.include? "participant_ids")
        # Remove all previously existing Participants
        @election.participants.delete_all
      end

      if (!election_params.include? "district_ids")
        # Remove all previously existing Districts
        @election.districts.delete_all
      end

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
      params.require(:election).permit(:name, :election_date, :election_type_id, :jurisdiction_id, :active, :district_ids => [], :participant_ids => [])
    end
end
