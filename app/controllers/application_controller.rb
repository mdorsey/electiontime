class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_footer

  # Breadcrumbs
  breadcrumb 'Home', :root_path

  private

    # Confirms an admin user
    def admin_user
      redirect_to(root_url) unless (current_user && current_user.user_type_id === UserType.find_by(name: 'Admin').id)
    end

    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Loads the footer text
    def set_footer
      @content_location = ContentLocation.find_by(name: "footer_fine_print")
      if @content_location
        @content_footer = Content.find_by(content_location_id: @content_location.id)
      end
    end
end
