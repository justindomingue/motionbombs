class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]
  
  def new
    @title = 'Log in'
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
    flash[:success] = 'Logged out!'
    redirect_to :back
  end
end
