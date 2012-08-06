class RenameSrcToProviderVideoId < ActiveRecord::Migration
  def change
    rename_column :videos, :src, :provider_video_id
  end
end
