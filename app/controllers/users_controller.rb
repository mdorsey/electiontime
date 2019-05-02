class UsersController < ApplicationController

  before_action :admin_user,      only: [:index, :create, :new, :destroy]
  before_action :set_user,        only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user,  only: [:edit, :update, :show]
  before_action :correct_user,    only: [:edit, :update, :show]

  def index
    @users = User.paginate(page: params[:page]).order('last_name ASC')
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      @user.send_activation_email
      flash[:info] = "User created successfully. Confirmation email has been sent to activate the account."
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def edit
  end

  def new
    @user = User.new
  end

  def show
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :user_type_id, :password, :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
