class RemoveLikesFromVideos < ActiveRecord::Migration
  def self.up
    remove_column :videos, :likes
  end
 
  def self.down
    add_column :videos, :likes, :integer
  end
end
