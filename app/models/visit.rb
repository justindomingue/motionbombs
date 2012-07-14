class Visit < ActiveRecord::Base
  attr_accessible :user_id, :video_id, :ip, :visits
  
  belongs_to :video
  belongs_to :user
  
  def self.increment_for_user(user_id, video_id)
    visit = Visit.find_by_user_id(user_id)
    if visit.present?
      visit.visits += 1
    else
      visit = Visit.new(user_id: user_id, video_id: video_id, visits:1)
      
      # increment the video views column
      video = Video.find(video_id)
      video.views += 1
      video.save
    end
    visit.save
  end
  
  def self.increment_for_ip(ip, video_id)
    visit = Visit.find_by_ip(ip)
    if visit.present?
      visit.visits += 1
    else
      visit = Visit.new(ip: ip, video_id: video_id, visits:1)
      
      # increment the video views column
      video = Video.find(video_id)
      video.views += 1
      video.save
    end
    visit.save
  end
end