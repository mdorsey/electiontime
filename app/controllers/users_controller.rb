class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save

      # Log the user in and redirect to show
      log_in @user
      flash[:success] = "New user created successfully"
      redirect_to @user
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :user_type_id, :password, :password_confirmation)
    end
end
