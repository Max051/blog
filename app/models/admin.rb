class Admin < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  validates_uniqueness_of :id
  #validate only when trying to create
  validate :OneAdmin, :on => :create

private

#Prevent making more than 1 admin
def OneAdmin
  unless Admin.count < 1
    errors.add(:id,'You cannot have more than one admin')
  end
end

end
