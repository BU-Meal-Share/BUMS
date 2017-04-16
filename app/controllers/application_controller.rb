class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if (session[:user_id])
      puts "session[:user_id]"
      puts session[:user_id]
    else
      puts "false"
    end
    @current_user ||= User.find_by(id: session[:user_id]) #if session[:user_id]
    p "current user"
    p @current_user
    return @current_user
  end
end
