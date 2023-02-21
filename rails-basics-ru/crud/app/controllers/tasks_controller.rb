class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'New task was created'

      redirect_to tasks_path
    else
      flash[:failure] = 'Task can not be created'

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task was updated'

      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task can not be updated'

      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task was deleted'

      redirect_to tasks_path
    else
      flash[:failure] = 'Task can not be deleted'

      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task)
          .permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
