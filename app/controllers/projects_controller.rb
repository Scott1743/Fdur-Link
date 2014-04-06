#encoding: utf-8
class ProjectsController < ApplicationController
  before_action :check_signed_in
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :find_current_user

  def index
    @projects = current_user.projects.all
    @project = current_user.projects.build
  end

  def show
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    custom_project_params = project_params
    if custom_project_params[:name].nil?
      custom_project_params[:name] = '未命名'
    end
    custom_project_params[:state] = 'open'
    project = current_user.projects.build custom_project_params
    if project.save
      flash[:success] = '建立成功'

      redirect_to action: :index
    else
      flash.now[:failed]= '建立失败'
      render action: 'new' 
    end
  end

  def update
    if @project.update(project_params)
      redirect_to [@user,@project], notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:success] = '删除成功'
    redirect_to projects_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name,:description,:is_public)
    end

    def find_current_user
      @user = current_user
    end
end
