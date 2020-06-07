class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def create
   Task.create(task: task_params[:task], limit_date: task_params[:limit_date], user_id: current_user.id)
  end
  
  def show
  end
  
  def new
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    task = Task.find[:id]
    if task.user_id == current_user.id
      diary.update(task_params)
    end
  end
  
  def destroy
    task = Task.find[:id]
    if task.user_id == current_user.id
      diary.destroy(task_params)
    end
  end
  
  private
  def task_params
    params.permit(:task, :limit_date)
  end
  
  



end
