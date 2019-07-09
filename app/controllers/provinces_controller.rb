class ProvincesController < ApplicationController

  before_action :admin_user
  before_action :set_province, only: [:show, :edit, :update, :destroy]

  def index
    @provinces = Province.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @province = Province.new(province_params)

    if @province.save
      flash[:info] = "Province created successfully"
      redirect_to provinces_url
    else
      render 'new'
    end
  end

  def destroy
    @province.destroy
    flash[:success] = "Province deleted"
    redirect_to provinces_url
  end

  def edit
  end

  def new
    @province = Province.new
  end

  def show
  end

  def update
    if @province.update_attributes(province_params)
      flash[:success] = "Province updated"
      redirect_to @province
    else
      render 'edit'
    end
  end

  private

    def set_province
      @province = Province.find(params[:id])
    end

    def province_params
      params.require(:province).permit(:name)
    end
end
