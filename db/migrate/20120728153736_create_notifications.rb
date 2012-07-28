class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :receiver_id
      t.integer :sender_id
      t.integer :video_id
      t.string :type
      t.boolean :status

      t.timestamps
    end
  end
end
