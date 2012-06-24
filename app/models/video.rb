class Video < ActiveRecord::Base
  attr_accessible :id, :title, :description, :thumb, :url, :provider_video_id, :provider, :views, :likes
  
  validates :title, :description, :thumb, :url, :provider_video_id, :provider, :presence => true
  validates :title, :length => { :maximum => 50 }
  validates :description, :length => { :maximum => 500 }
  validates :thumb, :format => { :with => /http:\/\/.+\.[jpg|png|gif]/i}
  validates :url, :views, :likes, :numericality => { :only_integer => true }
  validates :url, :uniqueness => true
  
  def get_vimeo_video_id(provider_url)
    provider_url.scan(/vimeo.com\/(\d+)\/?/).flatten.to_s.gsub(/\W+/, '') 
  end
  
  def get_youtube_video_id(provider_url)
    provider_url.scan(/youtube.com\/.+v=([a-zA-Z0-9]+)\/?/).flatten.to_s.gsub(/\W+/, '') 
  end
  
  def get_thumb_from_youtube(provider_video_id)
    "http://img.youtube.com/vi/#{provider_video_id}/2.jpg"
  end
end
