module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    Log.create(user_id: user.id, log_type_id: LogType.find_by(name: "Session").id, message: "User logged in")
  end

  # Logs out the current user.
  def log_out
    Log.create(user_id: current_user.id, log_type_id: LogType.find_by(name: "Session").id, message: "User logged out")
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the given user is the current user, false otherwise
  def current_user?(user)
    user == current_user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Returns true if the user is logged in and an Admin user type, false otherwise.
  def is_admin_user?
    logged_in? && (current_user.user_type_id === UserType.find_by(name: 'Admin').id)
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  # Returns true if the current user is linked to at least one participant in a future election, false otherwise.
  def user_has_participant_in_future_election?
    logged_in? && current_user.participants_in_future_elections.any?
  end
end
