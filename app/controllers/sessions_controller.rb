#encoding: utf-8
class SessionsController < ApplicationController
  # layout false

  def new
    if signed_in?
      redirect_to projects_path
    end
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	  sign_in user
      flash[:success] = "欢迎回来,#{current_user.name}"
  	  redirect_to projects_path current_user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end
end
