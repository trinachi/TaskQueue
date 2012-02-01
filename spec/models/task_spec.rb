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
  
  describe "resume" do
    it "sets the task as not complete" do
      task = Task.create(:completed => true)
      task.resume
      task.completed.should == false
    end
  end
  
  describe "finish" do
    it "sets task as complete" do
      task = Task.create(:completed => false)
      task.finish
      task.completed.should == true
    end
  end
  
  describe "move_up" do
    it "increases the priority of a task by 1" do
      task = Task.create(:priority => 3)
      task.move_up
      task.priority.should == 2
    end
  end
  
  describe "move_down" do
    it "decreases the priority of a task by 1" do
      task = Task.create(:priority => 3)
      task.move_down
      task.priority.should == 4
    end
  end
      
  describe "by_priority" do
    it "orders by priority, ascending" do
      task1 = Task.create(:priority => 1)
      task2 = Task.create(:priority => 2)
      task3 = Task.create(:priority => 3)
    
      Task.by_priority.should ==  [task1,task2,task3]
    end
  end
end
