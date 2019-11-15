class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    admin_user_signed_in? ? current_admin_user.try(:id) : 'Próprio dono do perfil'
  end

  protect_from_forgery

  def access_denied(exception)
    redirect_to admin_dashboard_path, alert: exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end
end
