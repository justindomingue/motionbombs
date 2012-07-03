class VideosController < ApplicationController
  before_filter :require_login, :only => [:new, :create]
  def index
    @videos = Video.last(50)
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
end
