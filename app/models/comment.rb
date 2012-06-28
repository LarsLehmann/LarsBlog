class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :name, :mail

  validates :name, :body, :mail,  :presence => true
  include Rakismet::Model
  attr_accessor :commenter_name, :commenter_email
  rakismet_attrs :name => :commenter_name, :mail => :commenter_email

end
