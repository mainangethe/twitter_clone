# Manage sessions for users
class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  def new; end

  def create
    if @user && check_password
      login @user
      redirect_to @user
      flash[:success] = "Welcome back #{@user.name}"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  private

    def set_user
      @user = User.find_by(email: params[:session][:email].downcase)
    end

    def check_password
      @user.authenticate(params[:session][:password])
    end
end
