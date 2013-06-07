class User < ActiveRecord::Base
  
  attr_accessible :email, :password_digest
  
  validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  
  # build in user auth from rails.
  # need 3.1 and above.
  has_secure_password
  
end
