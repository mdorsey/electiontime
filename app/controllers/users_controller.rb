class UsersController < ApplicationController

  before_action :admin_user, only: [:index, :create, :new, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update, :show]

  def index
    @users = User.search(params[:search]).paginate(page: params[:page]).order('last_name ASC')
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      @user.send_activation_email
      flash[:success] = "User created successfully. Confirmation email has been sent to activate the account."
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    else
      flash[:danger] = "Deletion failed! This User is being used by another object and cannot be deleted."
      redirect_to @user
    end
  end

  def edit
    display_proper_view(@user, 'edit', 'edit_own_settings')
  end

  def new
    @user = User.new
  end

  def show
    display_proper_view(@user, 'show', 'show_own_settings')
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      display_proper_view(@user, 'edit', 'edit_own_settings')
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :user_type_id, :password, :password_confirmation)
    end

    # Confirms the correct user, or if the user is an Admin
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless (current_user?(@user) || is_admin_user?)
    end

    def display_proper_view(user, admin_view, own_settings_view)
      if current_user?(user)
        render own_settings_view
      elsif is_admin_user?
        render admin_view
      else
        redirect_to root_url
      end
    end
end
