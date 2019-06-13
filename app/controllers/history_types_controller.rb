class HistoryTypesController < ApplicationController
  
  before_action :admin_user
  before_action :set_history_type, only: [:show, :edit, :update, :destroy]

  def index
    @history_types = HistoryType.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @history_type = HistoryType.new(history_type_params)

    if @history_type.save
      flash[:info] = "History Type created successfully"
      redirect_to history_types_url
    else
      render 'new'
    end
  end

  def destroy
    @history_type.destroy
    flash[:success] = "History Type deleted"
    redirect_to history_types_url
  end

  def edit
  end

  def new
    @history_type = HistoryType.new
  end

  def show
  end

  def update
    if @history_type.update_attributes(history_type_params)
      flash[:success] = "History Type updated"
      redirect_to @history_type
    else
      render 'edit'
    end
  end

  private

    def set_history_type
      @history_type = HistoryType.find(params[:id])
    end

    def history_type_params
      params.require(:history_type).permit(:name)
    end
end
