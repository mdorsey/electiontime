class PasswordResetsController < ApplicationController

  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  # Breadcrumbs
  breadcrumb 'Forgot Password', :new_password_reset_path, only: [:new]
  breadcrumb 'Reset Password', :edit_password_reset_path, only: [:edit]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)

    if @user
      @user.create_reset_digest
      
      if @user.send_password_reset_email
        flash.now[:success] = "An email has been sent to you containing a link to reset your password. Check your email to continue."
        Log.create(user_id: @user.id, log_type_id: LogType.find_by(name: "Email Sent").id, message: "Password Reset email sent to " + @user.email)
      else
        flash.now[:danger] = "Error! The password reset email was not sent. Please contact support for assistance."
      end
      
    else
      flash.now[:danger] = "Error! The email address you entered was not found. Please try again, or contact support for assistance."
    end

    render 'new'
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Your password has been reset and you have been logged in."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "This password reset link has expired. Please try again."
        redirect_to new_password_reset_url
      end
    end
end