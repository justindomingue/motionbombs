class AddCategoryIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :category_id, :integer
    add_index :videos, [:category_id, :created_at]
  end
end
