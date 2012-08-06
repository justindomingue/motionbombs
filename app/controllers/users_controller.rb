class UsersController < ApplicationController
  before_filter :require_login, :only => [:edit, :update]
  before_filter :has_access_to_user?, :only => [:edit, :update]
  
  def new
    @title = 'Register'
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Signed up! You can now log you in."
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end
  
  def update
    if current_user.update_attributes(params[:user])
      redirect_back_or_to(edit_user_path(current_user), :notice => 'Profile successfully updated.')
    else
      flash.now.alert = "Error while updating your profile."
      render :new
    end
  end
  
  private
  
    def has_access_to_user?
    unless current_user == User.find(params[:id])
      not_user_page
    end
  end
end