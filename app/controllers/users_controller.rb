class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :require_same_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]


  def show
   @user = current_user
   @tasks = @user.tasks&.page(params[:page]).per(2)
   flash[:alert] = "You can only show, edit or delete your own account"
    redirect_to tasks_path if @user.id !=  params[:id].to_i
  end

  def new
   @user=User.new
    if logged_in?
     redirect_to tasks_path
    end
   end


  def edit
  end


  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id), notice: 'User was successfully created'
          # redirect_to tasks_path
      else
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
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :id)
  end

  # def require_same_user
  #   if current_user != @task.user  && !current_user.admin?
  #     flash[:alert] = "You can only show, edit or delete your own account"
  #     redirect_to @user
  #   end
  # end
end
