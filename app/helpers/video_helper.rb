module VideoHelper
  include ActsAsTaggableOn::TagsHelper
  
  def format_for_youtube(provider_video_id)
    "<iframe id='ytplayer' type='text/html' width='640' height='390' src='http://www.youtube.com/embed/#{provider_video_id}?&rel=0&theme=light&showinfo=0&hd=1&autohide=1&color=white' frameborder='0'/>".html_safe
  end
  
  def format_for_vimeo(provider_video_id)
    "<iframe src='http://player.vimeo.com/video/#{provider_video_id}' width='500' heigth='280' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>".html_safe
  end
end