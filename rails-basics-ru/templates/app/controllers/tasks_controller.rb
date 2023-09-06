class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'New task was created'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task can not be created'
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      flash[:success] = 'Task was updated'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task can not be updated'
      render :edit
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    if @task.destroy
      flash[:success] = 'Task was deleted'
      redirect_to tasks_path
    else
      flash[:failure] = 'Task can not be deleted'
      redirect_to task_path(@task)
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :status, :creator, :performer, :completed)
    end
end
