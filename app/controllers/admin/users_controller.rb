class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]
  before_action  :if_not_admin

  PER = 3

  def index
    @users=User.all
  end


  def show
     @tasks = Task.where(user_id: @user.id).page(params[:page]).per(PER)
  end


  def new
    @user=User.new
  end


  def edit
  end


  def create
    @user= User.new(user_params)
     if @user.save
        flash[:success] = "new user added"
        redirect_to admin_users_path(@user.id)
      else
        flash.now[:danger] = "User sign Up failed"
        render :new
      end
    end


   def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
      user = User.find(params[:id])
      if (current_user == user) && (current_user.admin?)
      flash[:error] = "You cannot delete own admin account!"
      redirect_to admin_users_path
      elsif @user.destroy
        flash[:success] = "user deleted!"
        redirect_to admin_users_path
      else
        flash[:danger] = "user not deleted!"
        redirect_to admin_users_path
      end
    end


  private

  def set_user
    @user=User.find(params[:id])
  end

  def  if_not_admin
    redirect_to  tasks_path  unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :admin)

  end
end
