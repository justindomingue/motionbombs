class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_to(:root, :notice => 'Login successful.')
    else
      flash.now[:alert] = "Login failed."
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:root, :notice => 'Logged out!')
  end
end
