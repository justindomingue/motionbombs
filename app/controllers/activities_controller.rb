class ActivitiesController < ApplicationController
  
  def index
      
  end
  
  def user
    @user = User.find(params[:id])
    recent_videos = @user.videos
    recent_likes = @user.likes
    recent_comments = @user.video_comments
    recent_visits = @user.visits
    
    @activity = recent_videos + recent_likes + recent_comments + recent_visits
    @activity.sort! { |a,b| a.created_at <=> b.created_at }.reverse!
    @activity = @activity.paginate(:page => params[:page], :per_page => 30)
  end
end
