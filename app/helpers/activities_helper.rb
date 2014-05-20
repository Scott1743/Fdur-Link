module ActivitiesHelper

  include SessionsHelper

  def is_himself_project project
    project.user.eql? current_user
  end

end