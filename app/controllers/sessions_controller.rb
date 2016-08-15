class SessionsController < ApplicationController

  def new
  end

  def create 
    user = User.find_by(email: params[:email])
    session[:id] = user.id

    redirect_to root_path
  end
end
