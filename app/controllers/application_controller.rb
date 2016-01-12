class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_user
    unless user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:avatar]
    devise_parameter_sanitizer.for(:sign_up) << [
      :first_name,
      :last_name,
      :avatar
    ]
  end
end
