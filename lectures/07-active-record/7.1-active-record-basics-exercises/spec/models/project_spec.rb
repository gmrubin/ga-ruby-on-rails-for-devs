require 'spec_helper'

describe Project do
  context "employees count" do
    it "Should be equal to the number of employees" do
      project = Project.create(name: "Test_project", employees_count: 40)
      emp1 = Employee.create(name: "Gregg", address: "123 Street", start_date: "7/1/12")
      project.employees << emp1
      project.employees_count.should == 1
    end

    it "Should not be less than 0" do
      project = Project.create(name: "Test_project", employees_count: -15)
      project.employees_count.should == 0
    end
  end
end
