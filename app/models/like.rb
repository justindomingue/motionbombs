class Like < ActiveRecord::Base
  attr_accessible :user_id, :video_id
  
  belongs_to :user
  belongs_to :video, :counter_cache => true
  
  validates_presence_of :user_id, :video_id

end
