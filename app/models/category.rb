class Category < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :videos
  
  validates :name, :length => {
    minimum:4,
    maximum:50,
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
  }
  validates :description, :length => {
    minimum:4,
    maximum:150,
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
  }
end
