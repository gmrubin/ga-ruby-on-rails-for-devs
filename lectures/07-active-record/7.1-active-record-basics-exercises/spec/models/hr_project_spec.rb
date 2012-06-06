require 'spec_helper'

describe Project::HrProject do
  context "Description" do
    it "Should print out a harcoded description" do
      h = Project::HrProject.create(name: "A HR project", type: "HrProject")
      h.employees_count = 0
      h.save!
      h.description.should == "Human resources projects here."
    end
  end
end
