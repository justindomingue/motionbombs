module ApplicationHelper
  def title
    base_title = 'Motion Bombs'
    unless defined? @title
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end
end
