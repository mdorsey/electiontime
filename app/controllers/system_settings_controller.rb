class SystemSettingsController < ApplicationController
  
  before_action :admin_user
  before_action :set_system_setting, only: [:show, :edit, :update, :destroy]

  def index
    @system_settings = SystemSetting.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end

  def create
    @system_setting = SystemSetting.new(system_setting_params)

    if @system_setting.save
      flash[:success] = "System Setting created successfully"
      redirect_to system_settings_url
    else
      render 'new'
    end
  end

  def destroy
    if @system_setting.destroy
      flash[:success] = "System Setting deleted"
      redirect_to system_settings_url
    else
      flash[:danger] = "Deletion failed! This System Setting is being used by another object and cannot be deleted."
      redirect_to @system_setting
    end
  end

  def edit
  end

  def new
    @system_setting = SystemSetting.new
  end

  def show
  end

  def update
    if @system_setting.update_attributes(system_setting_params)
      flash[:success] = "System Setting updated"
      redirect_to @system_setting
    else
      render 'edit'
    end
  end

  private

    def set_system_setting
      @system_setting = SystemSetting.find(params[:id])
    end

    def system_setting_params
      params.require(:system_setting).permit(:name, :setting)
    end
end
