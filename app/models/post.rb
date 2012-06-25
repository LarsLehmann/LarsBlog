class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments
  validates_presence_of :title, :message => "Ahhhh!"
  paginates_per 5

end


