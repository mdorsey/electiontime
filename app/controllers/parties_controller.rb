class PartiesController < ApplicationController

  before_action :admin_user
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  def index
    @parties = Party.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @party = Party.new(party_params)

    if @party.save
      flash[:info] = "Party created successfully"
      redirect_to parties_url
    else
      render 'new'
    end
  end

  def destroy
    @party.destroy
    flash[:success] = "Party deleted"
    redirect_to parties_url
  end

  def edit
  end

  def new
    @party = Party.new
  end

  def show
  end

  def update
    if @party.update_attributes(party_params)
      flash[:success] = "Party updated"
      redirect_to @party
    else
      render 'edit'
    end
  end

  private

    def set_party
      @party = Party.find(params[:id])
    end

    def party_params
      params.require(:party).permit(:name, :name_abbreviation, :alternate_name, :alternate_abbreviation)
    end
end
