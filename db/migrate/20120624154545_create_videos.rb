class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :thumb
      t.integer :url
      t.string :src
      t.string :provider
      t.integer :views
      t.integer :likes

      t.timestamps
    end
  end
end
