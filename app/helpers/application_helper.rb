module ApplicationHelper
  def current_target
    current_user || current_admin
  end
end
