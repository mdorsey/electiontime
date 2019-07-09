class AddressesController < ApplicationController

  before_action :admin_user
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.paginate(page: params[:page]).order('id ASC')
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      flash[:info] = "Address created successfully"
      redirect_to addresses_url
    else
      render 'new'
    end
  end

  def destroy
    @address.destroy
    flash[:success] = "Address deleted"
    redirect_to addresses_url
  end

  def edit
  end

  def new
    @address = Address.new
  end

  def show
  end

  def update
    if @address.update_attributes(address_params)
      flash[:success] = "Address updated"
      redirect_to @address
    else
      render 'edit'
    end
  end

  private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:street, :city, :province_id, :postal_code)
    end
end
