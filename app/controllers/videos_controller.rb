class VideosController < ApplicationController
  before_filter :require_login, :only => [:new, :create]
  before_filter :increment_views, :only => :show
  
  def index
    @videos = Video.all
  end
  
  def show
    @video = Video.find(params[:id])
  end
  
  def new
    @video = Video.new
  end
  
  def create
    method = 'get_' + params[:video][:provider] + '_video_id'
    params[:video][:provider_video_id] = Video.send(method, params[:video][:url])
    params[:video][:thumb] = Video.get_thumb_from_youtube(params[:video][:provider_video_id])
    params[:video][:views] = params[:video][:likes] = 0    
    params[:video][:user_id] = current_user
    @video = Video.new(params[:video])
    if @video.save
      redirect_to video_path(@video), notice:'Video added successfully.'
    else
      render :new
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
