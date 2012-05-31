class Employee < ActiveRecord::Base
  attr_accessible :name, :address, :start_date
  validates :name, :presence => true
  validates :address, :presence => true
  validates :start_date, :presence => true
  belongs_to :role

  has_many :employee_projects
  has_many :projects, :through => :employee_projects
end
