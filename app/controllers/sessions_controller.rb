class SessionsController < ApplicationController
  def new
    if logged_in?
     redirect_to tasks_path
    end
  end

  def create
   user= User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      flash[:danger] = 'Incorrect password and email: Please check your login details again'
      render :new
    end
  end

  def destroy
    # session.delete(:user_id) if @user == urrent_user
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to new_session_path
  end
end
