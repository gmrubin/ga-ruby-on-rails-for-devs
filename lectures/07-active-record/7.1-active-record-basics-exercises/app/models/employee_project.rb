class EmployeeProject < ActiveRecord::Base
  attr_accessible :employee_id, :project_id
  belongs_to :employee
  belongs_to :project
end
