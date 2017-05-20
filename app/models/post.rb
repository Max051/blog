class Post < ActiveRecord::Base
  #Post must have title and content
  validates_presence_of :title
  validates_presence_of :content
end
