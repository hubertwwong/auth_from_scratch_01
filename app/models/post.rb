class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name
end
