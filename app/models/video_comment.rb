class VideoComment < ActiveRecord::Base
  attr_accessible :user_id, :video_id, :content, :mood
  
  validates_presence_of :user_id, :video_id, :content
  validates :content, :length => { :maximum => 200, :too_long => "%{count} characters is the maximum allowed" }
  
  #belongs_to :video
  belongs_to :video, :counter_cache => true
  belongs_to :user
end
