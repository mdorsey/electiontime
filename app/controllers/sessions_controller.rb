class SessionsController < ApplicationController

  # Breadcrumbs
  breadcrumb 'Log In', :login_path, only: [:new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])

      if user.activated?
        # Log the user in, remember them
        log_in(user)
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)

        # Redirect to the Public Profiles page, or the homepage
        if user.participants_in_future_elections.any?
          redirect_to profiles_path
        else
          redirect_to root_url
        end
        
      else
        flash[:danger] = 'Your account is not active. Please contact support for assistance.'
        redirect_to root_url
      end

    else
      flash.now[:danger] = 'Invalid email & password combination. Please try again.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
