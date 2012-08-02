class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_notifications
  
  private
  
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end
  
  def not_user_page
    flash[:error] = "You cannot access this protected page."
    redirect_to root_path
  end
  
  def set_notifications
    @notifications = current_user.notifications.where(status:false) if current_user
  end
end
