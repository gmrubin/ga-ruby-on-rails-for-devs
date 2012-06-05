require 'spec_helper'

describe MarketingProject do
  context "Description" do
    it "Should print out a hardcoded description" do
      m = MarketingProject.create(name:"A marketing project", type: "MarketingProject")
      m.employees_count = 0
      m.save!
      m.description.should == "Marketing projects go here."
    end
  end
end