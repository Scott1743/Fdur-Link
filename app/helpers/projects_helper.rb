module ProjectsHelper

  include SessionsHelper

  def milestone_news project
    unless @milestones_news = project.milestones.where( state: 'doing' ).blank?
      return @milestones_news = project.milestones.where( state: 'doing' ).order(:updated_at).last
    else
      return @milestones_news = project.milestones.where( state: 'finished' ).order('updated_at DESC').last
    end
  end

  def is_himself_project?
    @project.user.eql? current_user
  end

end
