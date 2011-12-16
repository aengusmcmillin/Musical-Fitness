class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, :presence => true, :length => { :minimum => 6, :maximum => 20 }
  validates :email, :presence => true, :format => { :with => email_regex }
end
