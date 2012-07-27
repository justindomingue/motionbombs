class AddLikesCountToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :likes_count, :integer, :default => 0
    
    Video.reset_column_information
    Video.find(:all).each do |p|
      p.update_attribute :likes_count, p.likes.length
    end

  end
end
