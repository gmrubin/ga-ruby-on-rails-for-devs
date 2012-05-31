require 'spec_helper'

describe DevelopmentProject do
  context "Description" do
    it "Should return a hardcoded description" do
      d = DevelopmentProject.create(name: "A development project", type: "DevelopmentProject", employees_count: 0)
      d.description.should == "Development projects go here."
    end
  end
end
