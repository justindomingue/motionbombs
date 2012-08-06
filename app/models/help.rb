class Help < ActiveRecord::Base
  attr_accessible :name, :email, :message, :status
  
  validates_presence_of :email, :message, :status
  validates :status, :inclusion => { :in => ["Complete", "Opened"] }  
  
  scope :opened, where(:status => 'Opened')
  scope :complete, where(:status => 'Complete')
end
