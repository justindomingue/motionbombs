class Like < ActiveRecord::Base
  attr_accessible :user_id, :video_id
  
  after_commit :notify_user
  
  belongs_to :video, :counter_cache => true
  belongs_to :user
  
  validates_presence_of :user_id, :video_id

  private
  
  def notify_user
    unless self.user.videos.include? self.video
      notification = Notification.new(receiver_id:self.video.user.id, sender_id:self.user.id, video_id:self.video.id, action:'lik', status:false)
      notification.save
    end
  end
end
