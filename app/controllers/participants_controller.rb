class ParticipantsController < ApplicationController

  before_action :admin_user
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.paginate(page: params[:page])
  end

  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      flash[:info] = "Participant created successfully"
      redirect_to participants_url
    else
      render 'new'
    end
  end

  def destroy
    @participant.destroy
    flash[:success] = "Participant deleted"
    redirect_to participants_url
  end

  def edit
  end

  def new
    @participant = Participant.new
  end

  def show
  end

  def update
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
      params.require(:participant).permit(:user_id, :email, :phone, :website, :biography, :is_incumbent, :is_candidate, :address_id, :district_id, :party_id, :leader_participant_id)
    end
end
