#encoding: utf-8
class UsersController < ApplicationController
  before_action :set_user, only: [:detail, :edit, :update]
  before_action :check_signed_in ,except: [:new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def detail
    @user_detail = @user.user_detail
  end

  def new
    if signed_in?
      redirect_to projects_path
    end
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "注册成功，欢迎来到Fdur"
      redirect_to projects_path
    else
      flash.now[:failed] = '注册失败，请检查您的注册信息'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash.now[:success] = 'User was successfully updated.'
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:password,:password_confirmation)
    end
end
