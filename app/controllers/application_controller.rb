class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_user
    unless user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def station_authorize_user
    station = Station.find(params[:id])
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
    unless current_user.admin?
      if station.user != current_user
        raise ActionController::RoutingError.new("Not Found")
      end
    end
  end

  def review_authorize_user
    review = Review.find(params[:id])
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
    unless current_user.admin?
      if review.user != current_user
        raise ActionController::RoutingError.new("Not Found")
      end
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
