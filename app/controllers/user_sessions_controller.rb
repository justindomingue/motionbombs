class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password], params[:remember_me])
      flash[:success] = 'Login successful.'
      redirect_back_or_to root_path
    else
      flash[:error] = 'Username or password was invalid.'
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => 'Logged out!'
  end
end
