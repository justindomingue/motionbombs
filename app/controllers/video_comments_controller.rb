class VideoCommentsController < ApplicationController
  def create
    @comment = VideoComment.create(params[:video_comment])
    @video = @comment.video
    @comments = VideoComment.last(5).reverse
    render :toggle      
  end
  
  def destroy
    comment = VideoComment.find(params[:id]).destroy
    @video = comment.video
    render :toggle
  end
end
