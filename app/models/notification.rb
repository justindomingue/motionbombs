class Notification < ActiveRecord::Base
  attr_accessible :receiver_id, :sender_id, :video_id, :action, :status
end
