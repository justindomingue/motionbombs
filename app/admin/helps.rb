ActiveAdmin.register Help do
  index do
    column :id
    column :name
    column :email
    column :message
    column :created_at
    default_actions
  end
  
  filter :id
  filter :name
  filter :email
  filter :message
  filter :created_at
end
