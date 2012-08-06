class CreateVideoComments < ActiveRecord::Migration
  def change
    create_table :video_comments do |t|
      t.integer :user_id
      t.integer :video_id
      t.text :content
      t.integer :mood, :default => 0

      t.timestamps
    end
  end
end
