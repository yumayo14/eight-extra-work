class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :address, :avatar, :facebook_url, :summary, :text, :gender])
    devise_parameter_sanitizer.permit(:edit, keys: [:name, :birthday, :address, :avatar, :facebook_url, :summary, :text, :gender])
  end
end
