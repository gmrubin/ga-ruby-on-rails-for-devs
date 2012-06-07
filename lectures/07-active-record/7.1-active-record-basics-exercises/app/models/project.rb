class Project < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :employee_projects
  has_many :employees, :through => :employee_projects
  validate :validate_ensure_employees_count_positive
  before_validation :update_employees_count


  private
    def update_employees_count
      self.employees_count = employees.size
    end

    def validate_ensure_employees_count_positive
      if self.employees_count < 0
        self.employees_count = 0
      end
    end
end
