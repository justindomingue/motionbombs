class VideoComment < ActiveRecord::Base
  attr_accessible :user_id, :video_id, :content, :mood
  after_commit :notify_user
  
  validates_presence_of :user_id, :video_id, :content
  validates :content, :length => { :maximum => 200, :too_long => "%{count} characters is the maximum allowed" }
  
  belongs_to :video, :counter_cache => true
  belongs_to :user
  
  private
  
  def notify_user
    unless self.user.videos.include? self.video
      notification = Notification.new(receiver_id:self.video.user.id, sender_id:self.user.id, video_id:self.video.id, action:'comment', status:false)
      notification.save
    end
  end
end
