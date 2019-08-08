class LogsController < ApplicationController

  before_action :admin_user
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  def index
    @logs = Log.paginate(page: params[:page]).order('created_at DESC')
  end

  def create
    @log = Log.new(log_params)

    if @log.save
      flash[:info] = "Log created successfully"
      redirect_to logs_url
    else
      render 'new'
    end
  end

  def destroy
    @log.destroy
    flash[:success] = "Log deleted"
    redirect_to logs_url
  end

  def edit
  end

  def new
    @log = Log.new
  end

  def show
  end

  def update
    if @log.update_attributes(log_params)
      flash[:success] = "Log updated"
      redirect_to @log
    else
      render 'edit'
    end
  end

  private

    def set_log
      @log = Log.find(params[:id])
    end

    def log_params
      params.require(:log).permit(:user_id, :log_type_id, :message, :location)
    end
end
