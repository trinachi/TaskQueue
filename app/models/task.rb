class Task < ActiveRecord::Base
  belongs_to :category
  
  def resume
    update_attribute(:completed, false)
  end
  
  def finish
    update_attribute(:completed, true)
  end
  
  def move_up
    decrement!(:priority, by = 1)
    Task.find_each do |other_task|
      if other_task.priority == self.priority && other_task.id != self.id
        other_task.increment!(:priority, by = 1)
      end
    end
  end
  
  def move_down
    increment!(:priority, by = 1)
    Task.find_each do |other_task|
      if other_task.priority == self.priority && other_task.id != self.id
        other_task.decrement!(:priority, by = 1)
      end
    end
  end
  
  def self.by_priority
    find(:all, :order => :priority)
  end
end
