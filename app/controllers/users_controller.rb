class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    #User model validations for =>  if !@user.nil? && !User.exists?(user_params) 
    if @user.save
      redirect_to root_path
    else
      render 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
