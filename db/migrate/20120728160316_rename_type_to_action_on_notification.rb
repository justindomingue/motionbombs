class RenameTypeToActionOnNotification < ActiveRecord::Migration
  def up
    rename_column :notifications, :type, :action
  end

  def down
    rename_column :notifications, :action, :type
  end
end
