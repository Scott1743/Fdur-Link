#encoding: utf-8
class SessionsController < ApplicationController
  # layout false

  def new
    if signed_in?
      redirect_to root_path
    end
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	  sign_in user
      flash[:success] = "欢迎回来,#{current_user.name}"
  	  redirect_to activities_path
    else
      flash.now[:failed] = '用户名或密码无效'
      render 'new'
    end
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end
end
