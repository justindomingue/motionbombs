ActiveAdmin.register Category do
  index do
    column :id
    column :name
    column :description
    default_actions
  end
end
