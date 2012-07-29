class Video < ActiveRecord::Base
  attr_accessible :id, :url, :title, :description, :thumb, :provider_video_id, :provider, :views, :likes, :user_id, :category_id, :creator
  belongs_to :user
  belongs_to :category
  has_many :likes
  has_many :visits
  has_many :video_comments
  has_many :notifications
  
  before_create do |video|
    # video.title.capitalize!
    #video.description.capitalize!
    #video.provider.capitalize!
  end
  
  validates :title, :thumb, :provider_video_id, :provider, :user_id, :presence => true
  validates :title, :length => { :maximum => 50 }
  validates :creator, :length => { :in => 2..30 }
  validates :description, :length => { :maximum => 500 }
  validates :thumb, :format => { :with => /http:\/\/.+\.[jpg|png|gif]/i}
  validates :views, :numericality => { :only_integer => true }
  
  scope :youtube, where(provider:"youtube")
  scope :vimeo, where(provider:"vimeo")
  
  scope :most_viewed, order('views DESC')
  scope :most_liked, order('likes_count DESC')
  scope :most_commented, order('video_comments_count DESC')
  scope :this_week, where(["created_at < ?", Time.now])
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  def self.get_youtube_video_id(provider_url)
    video_id = provider_url.split('v=')[1]
    ampersand_position = video_id.index('&')
    video_id = video_id.split('&')[0] if ampersand_position
    return video_id
  end
  
  def self.get_vimeo_video_id(provider_url)
    provider_url.scan(/vimeo.com\/(\d+)\/?/).flatten.to_s if provider_url.index('vimeo')
  end
  
  def self.get_thumb_from_youtube(provider_video_id)
    "http://img.youtube.com/vi/#{provider_video_id}/0.jpg"
  end
end
