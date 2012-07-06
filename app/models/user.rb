class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email,  :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  #def self.current
   # Thread.current[:user]
  #end

  #def self.current=(user)
   # Thread.current[:user] = user
  #end
   def has_role? (rolename)
    if 
     role == rolename.to_s
     true
     else
     false
     end 
   end


end
