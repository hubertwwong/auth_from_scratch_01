class Post < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :title, :description
  
  validates_presence_of :title, :description, :user_id
  
end
