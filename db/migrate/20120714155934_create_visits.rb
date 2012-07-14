class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :video_id
      t.integer :user_id
      t.string :ip
      t.integer :visits

      t.timestamps
    end
  end
end
