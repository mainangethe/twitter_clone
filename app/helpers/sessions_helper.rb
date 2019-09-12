# all helpful methods that are relevant to the sessions controller
module SessionsHelper
  # logs in the given user
  def login(user)
    session[:user_id] = user.id
  end

  # returns the current logged-in user (if any)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        login user
        @current_user = user
      end
    end
  end

  # returns true if the usr is logged in, otherwise false
  def logged_in?
    !current_user.nil?
  end

  # logs out the current user
  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # forgets a user in persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def login_as(user)
    session[:user_id] = user.id
  end
end
