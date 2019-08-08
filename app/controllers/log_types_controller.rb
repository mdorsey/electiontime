class LogTypesController < ApplicationController
  
  before_action :admin_user
  before_action :set_log_type, only: [:show, :edit, :update, :destroy]

  def index
    @log_types = LogType.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @log_type = LogType.new(log_type_params)

    if @log_type.save
      flash[:info] = "Log Type created successfully"
      redirect_to log_types_url
    else
      render 'new'
    end
  end

  def destroy
    @log_type.destroy
    flash[:success] = "Log Type deleted"
    redirect_to log_types_url
  end

  def edit
  end

  def new
    @log_type = LogType.new
  end

  def show
  end

  def update
    if @log_type.update_attributes(log_type_params)
      flash[:success] = "Log Type updated"
      redirect_to @log_type
    else
      render 'edit'
    end
  end

  private

    def set_log_type
      @log_type = LogType.find(params[:id])
    end

    def log_type_params
      params.require(:log_type).permit(:name)
    end
end
