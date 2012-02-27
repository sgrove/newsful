class ApplicationController < ActionController::Base
  before_filter :authenticate_user_or_admin!, :only => [:new, :destroy, :create, :update]

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

  def current_target
    current_user || current_admin
  end
end
