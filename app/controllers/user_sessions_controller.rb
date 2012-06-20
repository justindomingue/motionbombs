class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_to root_path, :notice => 'Login successful.'
    else
      redirect_to login_path, :alert => 'Invalid username and/or password.'
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => 'Logged out!'
  end
end
