class LikesController < ApplicationController
  def create
    @like = Like.create(params[:like])
    @video = @like.video
    render :toggle      
  end
  
  def destroy
    like = Like.find(params[:id]).destroy
    @video = like.video
    render :toggle
  end
end
