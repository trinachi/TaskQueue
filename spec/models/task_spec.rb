require 'spec_helper'

describe Task do
  describe "category" do
    
    it "can be set" do
      task = Task.new
      category = Category.new
      task.category = category
      task.category.should == category
    end
    
  end
end
