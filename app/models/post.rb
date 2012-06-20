class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments
  validates :title, :body, :presence => "true" 
end
