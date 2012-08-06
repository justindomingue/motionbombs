ActiveAdmin.register VideoComment do
  
  index do
    column :id
    column ("Username") { |v| v.user.username }
    column :content
    column :created_at
    default_actions
  end
  
  filter :id
  filter :content
  filter :created_at
  
end
