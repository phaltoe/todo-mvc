class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end 

  def logged_in?
    !!current_user
  end 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #METHODS YOU BUILD IN THE CONTROLLER DO NOT PERMEATE TO THE ACTIONVIEW PART OF YOUR CODE,
  #UNLESS YOU EXPLICITLY YOU CAN'T CALL THIS ON YOUR HTML.ERB

  #THIS IS A HELPER METHOD, PLEASE LET ME USE THIS IN MY VIEW:

  helper_method :current_user 

end
