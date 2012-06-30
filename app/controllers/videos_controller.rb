class VideosController < ApplicationController
  
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
    @video = Video.new(params[:video], :provider_video_id => @provider_video_id, :thumb => @thumb)
    if @video.save
      redirect_to video_path('1'), notice:'Video added successfully.'
    else
      render :new
    end
  end
end
