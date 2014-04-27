#encoding: utf-8
class UserDetailsController < ApplicationController
  before_action :set_user_detail
  before_action :user_detail_params

  def update
    begin
      @user_detail.update!(user_detail_params)
      flash[:success] = '修改成功'
      redirect_to user_path current_user
    rescue Exception
      @user = current_user
      flash.now[:failed] = '修改失败，头像请使用小于2M的jpeg、jpg、png格式图片'
      render detail_users_path
    end
  end

  private

  def set_user_detail
    @user_detail = UserDetail.where(id: params[:id]).first
  end

  def user_detail_params
    params.require(:user_detail).permit(:name,:description,:avatar)
  end

end
