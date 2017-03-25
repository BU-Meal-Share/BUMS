class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
  
  def show
  end

  def index
#    redirect_to :action => 'login'
  end
  
  def login
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
