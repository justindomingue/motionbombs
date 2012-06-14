module ApplicationHelper
  
  def title
    base_title = 'Motion Bombs'
    if @title.empty?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end
end
