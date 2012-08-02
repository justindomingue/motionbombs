class ActivitiesController < ApplicationController
  
  def index
    @recent_videos = Video.last 30
    @recent_likes = Like.last 30
    @recent_comments = VideoComment.last 30
    
    format_activity
  end
  
  def user
    @user = User.find(params[:id])
    @recent_videos = @user.videos
    @recent_likes = @user.likes
    @recent_comments = @user.video_comments
    
    format_activity
  end
  
  private
  
  def format_activity
    @activity = @recent_videos + @recent_likes + @recent_comments
    @activity.sort! { |a,b| a.created_at <=> b.created_at }.reverse!
    @activity = @activity.paginate(:page => params[:page], :per_page => 30)
  end
end
