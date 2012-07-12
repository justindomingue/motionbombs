module ApplicationHelper
  def title
    base_title = 'Motion Bombs'
    unless defined? @title
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end
end
