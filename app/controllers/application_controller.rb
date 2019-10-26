class ApplicationController < ActionController::Base
  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to request.referrer, alert: exception.message }
    end
  end

  private
  def current_ability
    if current_worker
      @current_ability ||= Ability.new(current_worker)
    elsif current_commerce
      @current_ability ||= CommerceAbility.new(current_commerce)
    end
  end
end
