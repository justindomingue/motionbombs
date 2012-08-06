class AddCreatorToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :creator, :string

  end
end
