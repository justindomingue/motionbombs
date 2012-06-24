module VideoHelper
  
  def format_for_youtube(provider_video_id)
    '<iframe id="ytplayer" type="text/html" width="640" height="390" src="http://www.youtube.com/embed/#{provider_video_id}" frameborder="0"/>'
  end
  
  def format_for_vimeo(provider_video_id)
    '<iframe src="http://player.vimeo.com/video/#{provider_video_id}" width="500" height="208" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>'
  end

end