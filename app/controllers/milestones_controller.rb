class MilestonesController < ApplicationController

  before_action :set_project

  def create
    milestone = @project.milestones.build milestone_params
    @milestones =  @project.milestones
      if milestone.save
        render
      end
  end

  private

  def milestone_params
    params.require(:milestone).permit(:name,:image)
  end

  def set_project
    @project = current_user.projects.where(id: params[:project_id]).first
    unless @project
      redirect_to '/404.html'
    end
  end

end
