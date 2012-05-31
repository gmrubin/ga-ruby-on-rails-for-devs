class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name, :type
  has_many :employee_projects
  has_many :employees, :through => :employee_projects
  before_validation :ensure_employees_count_positive
  before_validation :update_employees_count

  def description
    ""
  end

  private
    def update_employees_count
      self.employees_count = employees.count
    end

    def ensure_employees_count_positive
      if self.employees_count < 0
        self.employees_count = 0
      end
    end
end
