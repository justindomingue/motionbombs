class VideosController < ApplicationController
  before_filter :require_login, :only => [:new, :create]
  before_filter :increment_views, :only => :show
  before_filter :remove_notifications, :only => :show
  
  def index
    @title = 'Stop motion animation gallery and tutorials'
    @videos = Video.paginate(:page => params[:page]).per_page(12).order('created_at DESC')
    @categories = Category.all
  end
  
  def show
    @video = Video.find(params[:id])
    @title = @video.title
    @comments = @video.video_comments.order(:created_at).limit(5)
  end
  
  def new
    @title = 'Submit a stop motion animation'
    @video = Video.new
  end
  
  def create
    params[:video][:provider] = 'Youtube'
    params[:video][:provider_video_id] = Video.get_youtube_video_id(params[:video][:url])
    params[:video][:thumb] = Video.get_thumb_from_youtube(params[:video][:provider_video_id])
    params[:video][:views] = 0    
    params[:video][:user_id] = current_user.id
    tags_str = params[:video].delete(:tags)

    @video = Video.new(params[:video])
    @video.tag_list = tags_str
    if @video.save
      redirect_to video_path(@video), notice:'Video added successfully.'
    else
      render :new
    end
  end
  
  def browse
    @title = 'Browse stop motion gallery'
    @categories = Category.all
    
    if params[:trending]
      @filter = params[:trending]
      if params[:trending] == 'views'
        @videos = Video.most_viewed
      elsif params[:trending] == 'likes'
        @videos = Video.most_liked
      elsif params[:trending] == 'comments'
        @videos = Video.most_commented
      elsif params[:trending] == 'popular'
        @filter = "popular this week"
        @videos = Video.this_week.most_viewed
      end
    elsif params[:category]
      @filter = params[:category]
      @videos = Category.find_by_name(params[:category]).videos
    elsif params[:date]
      @filter = params[:date]
      if params[:date] == 'newest'
        @videos = Video.last 12
      elsif params[:date] == 'oldest'
        @videos = Video.first 12
      end
    else
      @videos = Video.last(12)
    end
  end
  
  private
      
    def increment_views
      if current_user
        Visit.increment_for_user(current_user.id, params[:id])
      else
        Visit.increment_for_ip(request.remote_ip, params[:id])
      end
    end
    
    def remove_notifications
      if params[:notification] && current_user
        notifications = current_user.notifications.where(video_id:params[:id])
        notifications.update_all(status:true)
      end
    end
end
