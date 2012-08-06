class AddStatusToHelp < ActiveRecord::Migration
  def self.up
    add_column :helps, :status, :string
  end
  
  def self.down
    remove_column :helps, :status
  end
end
