class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tasks = Task.includes(:user)
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to '/'
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to root_path
  end

  def show
  end

  private
  def task_params
    params.require(:task).permit(:reference_number, :invoice_number, :customer_email, :text).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
