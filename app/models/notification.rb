class Notification < ActiveRecord::Base
  attr_accessible :receiver_id, :sender_id, :video_id, :action, :status
  
  belongs_to :receiver, class_name:'User'
  belongs_to :sender, class_name:'User'
  belongs_to :video
end
