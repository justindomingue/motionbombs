class VideosController < ApplicationController
  before_filter :require_login, :only => [:new, :create]
  before_filter :increment_views, :only => :show
  before_filter :remove_notifications, :only => :show
  
  def index
    @title = 'Stop motion animation gallery and tutorials'
    @videos = Video.paginate(:page => params[:page]).per_page(12).order('created_at DESC')
    @categories = Category.find(:all, :order => "TRIM(LOWER(name))")
    @tags = Video.tag_counts_on(:tags).order("RANDOM()").first(50)
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

    @video = Video.new(params[:video])
    if @video.save
      redirect_to video_path(@video), notice:'Video added successfully.'
    else
      render :new
    end
  end
  
  def browse
    @title = 'Browse stop motion gallery'
    @categories = Category.all
    @tags = Video.tag_counts_on(:tags)
    
    parse_params
    
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
    
    def parse_params
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
      @videos = Category.find_by_name(@filter).videos
    elsif params[:date]
      @filter = params[:date]
      if params[:date] == 'newest'
        @videos = Video.last 12
      elsif params[:date] == 'oldest'
        @videos = Video.first 12
      end
    elsif params[:tag]
      @filter = params[:tag]
      @videos = Video.tagged_with(@filter)
    else
      @videos = Video.last(12)
    end
  end
end
