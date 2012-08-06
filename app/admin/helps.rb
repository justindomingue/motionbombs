ActiveAdmin.register Help do
  scope :opened
  scope :complete
  
  index do
    column :id
    column(:status) { |ticket| status_tag(ticket.status) }
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
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :status, :as => :radio, :collection => ["Complete", "Opened"]
      f.buttons
    end
  end
end
