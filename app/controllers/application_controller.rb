class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:admin]


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
