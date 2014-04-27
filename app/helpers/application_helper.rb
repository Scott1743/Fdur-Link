module ApplicationHelper
  include SessionsHelper
  def current_user_id
    current_user.id
  end

  def is_himself?
    @user.eql? current_user
  end
end
