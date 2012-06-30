class RemoveUrlFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :url
  end

  def down
    add_column :videos, :url, :integer
  end
end
