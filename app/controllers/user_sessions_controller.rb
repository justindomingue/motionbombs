class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password], params[:remember_me])
      redirect_back_or_to root_url, :notice => 'Login successful.'
    else
      redirect_to login_path, :alert => 'Username or password was invalid.'
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => 'Logged out!'
  end
end
