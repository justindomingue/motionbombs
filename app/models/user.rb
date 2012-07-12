class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  
  has_many :videos
  has_many :likes
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
  
  validates_presence_of :username, :email
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  
end
