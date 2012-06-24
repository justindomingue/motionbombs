class Video < ActiveRecord::Base
  attr_accessible :id, :title, :description, :thumb, :url, :src, :provider, :views, :likes
  
  validates :title, :description, :thumb, :url, :src, :provider, :presence => true
  validates :title, :length => { :maximum => 50 }
  validates :description, :length => { :maximum => 500 }
  validates :thumb, :format => { :with => /http:\/\/.+\.[jpg|png|gif]/i}
  validates :url, :views, :likes, :numericality => { :only_integer => true }
  validates :url, :uniqueness => true
end
