class ApplicationController < ActionController::Base
  check_authorization unless: :active_admin_controller?
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to request.referrer, alert: exception.message }
    end
  end

  def active_admin_controller?
    controller_path.include?("active_admin") || controller_path.include?("admin")
  end

  private
  def current_ability
    if current_worker
      @current_ability ||= Ability.new(current_worker)
    elsif current_commerce
      @current_ability ||= CommerceAbility.new(current_commerce)
    elsif current_admin_user
      @current_ability ||= AdminAbility.new(current_admin_user)
    end
  end
end
