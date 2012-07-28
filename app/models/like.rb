class Like < ActiveRecord::Base
  attr_accessible :user_id, :video_id
  
  after_create :notify_user
  
  belongs_to :video, :counter_cache => true
  belongs_to :user
  
  validates_presence_of :user_id, :video_id

  private
  
  def notify_user
    notification = Notification.new(receiver_id:self.video.user.id, sender_id:self.user.id, video_id:self.video.id, action:'like', status:false)
    notification.save
  end
end
