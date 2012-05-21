class Role < ActiveRecord::Base
  attr_accessible :name, :department
  validates :name, :presence => true
  validates :department, :presence => true
  has_many :employees
end
