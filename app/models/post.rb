class Post < ActiveRecord::Base
  attr_accessible :body, :title, :username
  has_many :comments
  validates_presence_of :title, :username , :message => "Ahhhh!"
  paginates_per 5

end


