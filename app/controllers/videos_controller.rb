class VideosController < ApplicationController
  before_filter :require_login, :only => [:new, :create]
  before_filter :increment_views, :only => :show
  
  def index
    @videos = Video.paginate(:page => params[:page]).per_page(12)
  end
  
  def show
    @video = Video.find(params[:id])
    @comments = @video.video_comments.order(:created_at).limit(5)
  end
  
  def new
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
    @categories = Category.all
    
    if params[:trending]
      @filter = params[:trending]
      if params[:trending] == 'views'
        @videos = Video.most_viewed
      elsif params[:trending] == 'likes'
      elsif params[:trending] == 'comments'
        @videos = VideoComment.order()
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
end
