class ParticipantsController < ApplicationController

  before_action :admin_user
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end

  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      flash[:success] = "Participant created successfully"
      redirect_to participants_url
    else
      render 'new'
    end
  end

  def destroy
    if @participant.destroy
      flash[:success] = "Participant deleted"
      redirect_to participants_url
    else
      flash[:danger] = "Deletion failed! This Participant is being used by another object and cannot be deleted."
      redirect_to @participant
    end
  end

  def edit
  end

  def new
    @participant = Participant.new
  end

  def show
  end

  def update
    # Remove any previous picture, if a new one was selected
    if params[:participant][:picture].present?
      @participant.picture.purge
    end

    if @participant.update_attributes(participant_params)
      flash[:success] = "Participant updated"
      redirect_to @participant
    else
      render 'edit'
    end
  end

  private

    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:user_id, :picture, :name, :email, :phone, :website, :biography, :is_incumbent, :is_candidate, :address_id, :district_id, :party_id, :leader_participant_id)
    end
end
