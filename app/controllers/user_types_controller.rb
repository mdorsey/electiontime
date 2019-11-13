class UserTypesController < ApplicationController

  before_action :admin_user
  before_action :set_user_type, only: [:show, :edit, :update, :destroy]

  def index
    @user_types = UserType.paginate(page: params[:page]).order('name ASC')
  end
  
  def create
    @user_type = UserType.new(user_type_params)

    if @user_type.save
      flash[:success] = "User Type created successfully"
      redirect_to user_types_url
    else
      render 'new'
    end
  end

  def destroy
    if @user_type.destroy
      flash[:success] = "User Type deleted"
      redirect_to user_types_url
    else
      flash[:danger] = "Deletion failed! This User Type is being used by another object and cannot be deleted."
      redirect_to @user_type
    end
  end

  def edit
  end

  def new
    @user_type = UserType.new
  end

  def show
  end

  def update
    if @user_type.update_attributes(user_type_params)
      flash[:success] = "User Type updated"
      redirect_to @user_type
    else
      render 'edit'
    end
  end

  private

    def set_user_type
      @user_type = UserType.find(params[:id])
    end

    def user_type_params
      params.require(:user_type).permit(:name)
    end
end
