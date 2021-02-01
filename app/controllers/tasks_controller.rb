
class TasksController < ApplicationController
before_action :set_task, only: [:show, :edit, :update, :destroy]
before_action :current_user
before_action :authenticate_user
before_action :require_same_user, only: [:edit, :update, :destroy]
before_action :logged_in?

PER = 3

def index
  @q=current_user.tasks.ransack(params[:q])
  @tasks = @q.result(distinct: true).page(params[:page]).per(2)
end


def show

end


def new
  if params[:back]
    @task = Task.new(task_params)
  else
    @task = Task.new
  end
end


def edit

end



def create
  @task = Task.new(task_params)
  @task.user_id=current_user.id
    if @task.save
      redirect_to tasks_path, notice: "New task created!"
     else
       render :new
     end
  end

def update
  respond_to do |format|
    if @task.update(task_params)
      format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      format.json { render :show, status: :ok, location: @task }
    else
      format.html { render :edit }
      format.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end
end


def destroy
  @task.destroy
  respond_to do |format|
    format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private

def set_task
  @task = Task.find(params[:id])
end


def task_params
  params.require(:task).permit(:name, :Details,:Deadline, :status, :priority,:user_id, :id)
end

def require_same_user
  if current_user != @task.user && !current_user.admin?
    flash[:alert] = "You can only edit or delete your own article"
    redirect_to @task
  end
 end
end
