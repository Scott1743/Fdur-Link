#encoding: utf-8
class UserDetailsController < ApplicationController
  before_action :set_user_detail
  before_action :user_detail_params

  def update
    if @user_detail.update(user_detail_params)
      flash[:success] = '修改成功'
      redirect_to detail_users_path
    else
      flash.now[:failed] = '修改成功'
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
