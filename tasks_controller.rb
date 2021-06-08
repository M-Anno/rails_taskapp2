class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.order(startdate: :ASC)
  end
  
  def new
    @task = Task.new(allday: "1")
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: "Resistered."
    else
      flash.now[:alert] = "Failed."
      render :action => :edit
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "Success to update."
    else
      flash.now[:alert] = "Failed."
      render :action => :edit
    end
  end
  
  def destroy
    if @task.destroy
      redirect_to root_path, notice: "Success to destroy."
    else
      redirect_to root_path, notice: "Couldn't destroy."
    end
  end
  
  private
  def find_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:title, :startdate, :enddate, :allday, :updated_at, :memo)
  end
    
end