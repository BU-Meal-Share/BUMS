class SessionsController < ApplicationController
  def create
    p "env"
    p env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"])
    p "User"
    p user
    session[:user_id] = user.id
    redirect_to events_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_path
  end
end