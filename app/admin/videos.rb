ActiveAdmin.register Video do
  index do
    column :id
    column :title
    column :user
    column :category
    column :provider
    column :views
    column :likes, :sortable => "likes.count" do |video|
      video.likes.count.to_s
    end
    default_actions
  end
  
  filter :title
  filter :user
  filter :category
  filter :provider
  filter :views
  filter :created_at
  
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :user
      f.input :category
      f.input :creator
      f.input :description
      f.input :thumb
      f.input :provider
      f.input :provider_video_id
      f.input :views
      f.buttons
    end
  end
end
