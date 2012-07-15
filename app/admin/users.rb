ActiveAdmin.register User do
  index do
    column :id
    column :username
    column :email
    column :created_at
    default_actions
  end
  
  filter :username
  filter :email
  filter :created_at
  
  form do |f|
    f.inputs "Credentials" do
      f.input :username
      f.input :email
    end
    f.buttons
  end
end
