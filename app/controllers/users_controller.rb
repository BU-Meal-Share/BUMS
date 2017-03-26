class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
  
  def show
  end

  def index

  end
  
  def login
=begin    
    @user = User.find_by_name(params[:name])
    @password = @user.password
    #if @password == params[:password]
=end

=begin
    @user = User.where(name: params[:name]).where(password: params[:password])
    if(@user)
      flash[:notice] = 'Welcome #{user.name}'
    else
      flash[:warning] = 'Login Unsuccessful'
    end
    redirect_to(events_path)
=end
    
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
