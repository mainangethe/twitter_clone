# all helpful methods that are relevant to the sessions controller
module SessionsHelper
  # logs in the given user
  def login(user)
    session[:user_id] = user.id
  end

  # returns the current logged-in user (if any)
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # returns true if the usr is logged in, otherwise false
  def logged_in?
    !current_user.nil?
  end

  # logs out the current user
  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
