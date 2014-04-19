#encoding: utf-8
class ProjectsController < ApplicationController
  before_action :check_signed_in
  before_action :set_project, only: [:show, :update, :destroy]
  before_action :find_current_user

  def index
    @projects = current_user.projects.order(id: :desc).all
    @project = current_user.projects.build
  end

  def show
    milestones =  @project.milestones.order('updated_at DESC')
    @milestones_undo = milestones.select {|m| m.state == 'undo'}
    @milestones_doing = milestones.select {|m| m.state == 'doing'}
    @milestones_finished = milestones.select{|m| m.state == 'finished'}
  end

  def create
    @projects = current_user.projects.order(id: :desc).all
    project = current_user.projects.build project_params
    #respond_to do |format|
      if project.save
        flash[:success] = '建立成功'

        redirect_to action: 'index'
        #format.js
      else
        flash.now[:failed]= '建立失败'
        render action: 'index'
      end
    #end
  end

  def update
    if @project.update(project_params)
      flash[:success] = '修改成功'

      redirect_to action: 'show'
    else
      flash.now[:failed]= '修改失败'
      render action: 'show'
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
      @project = current_user.projects.where(id: params[:id]).first
      unless @project
        redirect_to '/404.html'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name,:description,:is_public,:image)
    end

    def find_current_user
      @user = current_user
    end
end
