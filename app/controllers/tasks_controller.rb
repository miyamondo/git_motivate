class TasksController < ApplicationController
  
  def index
    @task = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.create(task: task_params[:task], user_id: current_user.id)
    # Task.create
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    task = Task.find(params[:id])
    if task.user_id == current_user.id
      task.update(task_edit_params)
    end
  end
  
  def destroy
    task = Task.find(params[:id])
    if task.user_id == current_user.id
      task.destroy
    end
  end

  private
  def task_params
    params.require(:task).permit(:task)
  end
  
  def task_edit_params
    params.permit(:task)
  end

end
