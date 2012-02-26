class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user_or_admin!
    if user_signed_in?
      @current_ability ||= Ability.new(current_user)
      return 
    elsif admin_signed_in?
      @current_ability ||= Ability.new(current_admin)
      return
    else
      authenticate_user!
    end
  end
end
