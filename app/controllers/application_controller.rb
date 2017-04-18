class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
   
    @current_user ||= User.find_by(id: session[:user_id]) #if session[:user_id]
  
    return @current_user
  end
end
