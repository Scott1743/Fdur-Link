#encoding: utf-8
class UsersController < ApplicationController
  before_action :set_user_from_id, only: [:show]
  before_action :set_user, only: [:detail, :edit, :update]
  before_action :check_signed_in ,except: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user_detail = @user.user_detail
    if @user == current_user
      @projects = @user.followed_projects
    else
      @projects = @user.projects.where(:is_public => true).order(updated_at: :desc)
    end
  end

  #def detail
  #  @user_detail = @user.user_detail
  #end

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
      redirect_to activities_path
    else
      flash.now[:failed] = '注册失败，请检查您的注册信息'
      render :new
    end
  end

  def update

    if !(current_user.authenticate(params[:user][:password_old]))
      flash.now[:failed] = '修改失败，原始密码错误'
      render :edit
    elsif current_user.authenticate(params[:user][:password_old]) && @user.update(user_params)
      flash[:success] = '修改成功，请重新登录'
      redirect_to @user
    else
      flash.now[:failed] = '修改失败，请检查您填入的信息'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

    def set_user_from_id
      @user = User.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:password,:password_confirmation)
    end
end
