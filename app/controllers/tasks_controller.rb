class TasksController < ApplicationController

  before_filter :find_task, :only => [:show, :edit, :update, :destroy, :complete, :incomplete]
  
  def index
    @tasks = Task.by_priority
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to @task, :notice => 'Task was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to @task, :notice => 'Task was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url
  end
  
  def complete
    @task.finish
    redirect_to tasks_path, :notice => "Task was completed"
  end
  
  def incomplete
    @task.resume
    redirect_to tasks_path, :notice => "Task has been re-opened"
  end
  
  def prioritize
    find_task
    @task.move_up
    redirect_to tasks_path, :notice => "Task has moved up in priority"
  end
  
  def deprioritize
    find_task
    @task.move_down
    redirect_to tasks_path, :notice => "Task has moved down in priority"
  end

private
  
  def find_task
    @task = Task.find(params[:id])
  end
end