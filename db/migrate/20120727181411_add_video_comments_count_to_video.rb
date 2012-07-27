class AddVideoCommentsCountToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :video_comments_count, :integer, :default => 0
    
    Video.reset_column_information
    Video.find(:all).each do |p|
      p.update_attribute :video_comments_count, p.video_comments.length
    end

  end
end
