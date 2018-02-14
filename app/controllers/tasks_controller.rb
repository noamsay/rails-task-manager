class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(task_params)
    redirect_to task_path(@tasks)
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
