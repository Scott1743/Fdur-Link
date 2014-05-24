#encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

def check_signed_in
  if signed_in?
    nil
  else
    flash[:failed] = "请先登录"
    redirect_to main_app.signin_path
  end
end

def check_is_admin
  if current_user.permission.name == 'admin'
    nil
  else
    flash.now[:failed] = "没有权限"
  end
end

end
