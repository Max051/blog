class Post < ActiveRecord::Base
  belongs_to :admin
  #Post must have title and content
  validates_presence_of :title
  validates_presence_of :content
end
