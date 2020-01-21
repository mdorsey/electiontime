class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless (current_user && current_user.user_type_id === UserType.find_by(name: 'Admin').id)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
end
