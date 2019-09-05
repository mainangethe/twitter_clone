# This controller helps manage users
class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.name}, Welcome to Twirra!"
      redirect_to @user
    else
      render 'new'
    end
    
  end
  
  private

    def user_params
      params
        .require(:user)
        .permit(
          :name,
          :email,
          :password,
          :password_confirmation
        )
    end

end