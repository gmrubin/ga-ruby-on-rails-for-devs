require 'spec_helper'

describe Project::DevelopmentProject do
  context "Description" do
    it "Should return a hardcoded description" do
      d = Project::DevelopmentProject.create(name: "A development project", type: "DevelopmentProject")
      d.employees_count = 0
      d.save!
      d.description.should == "Development projects go here."
    end
  end
end
