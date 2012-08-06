module ActivitiesHelper
  
  def render_icon(activity_class)
    case activity_class
    when "video"
      icon_name = 'film'
    when "like"
      icon_name = 'heart'
    when "videocomment"
      icon_name = 'comment'
    when "visit"
      icon_name = 'eye-open'
    end
    "<i class='icon-#{icon_name} margin-top-2'></i>".html_safe
  end
  
  def render_action_text(activity_class)
    case activity_class
    when "video"
      text = 'submitted'
    when "like"
      text = 'liked'
    when "videocomment"
      text = 'commented'
    when "visit"
      text = 'watched'
    end
    text
  end
  
  
end
