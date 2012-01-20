require 'spec_helper'

describe TimeInterval do
  describe ".all" do
    it "has 4 intervals of time" do
      TimeInterval.all.should == [5, 15, 30, 60]
    end
  end
  
  describe ".form_parameters" do
    it "returns an array for each interval with a string and an integer" do
      TimeInterval.form_parameters.first.should == ['5 min', 5]
    end
  end
end