class TasksController < ApplicationController

  before_filter :find_task, :only => [:show, :edit, :update, :destroy, :complete, :incomplete]
  
  def index
    if current_user != nil
      @tasks = current_user.tasks.by_priority
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id
    @task.category_id = 1
    if @task.save
      redirect_to tasks_path, :notice => 'Task was successfully created.'
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
  
  def show
    if @task.user_id == current_user.id
      render "show"
    else
      render "error"
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
  
  def time
    @tasks = current_user.tasks.organize_by_time(params[:free_time])
    render :template => 'tasks/time'
  end
  
  def category
    @tasks = current_user.tasks.organize_by_category(params[:category])
    render :template => "tasks/category"
  end
  
  def user_tasks
    get_tasks_for_user(current_user.id)
  end
  
  def timecat
    @tasks = current_user.tasks.organize_by_category(params[:category]).organize_by_time(params[:free_time])
    render :template => "tasks/timecat"
  end

private
  
  def find_task
    @task = Task.find(params[:id])
  end
end