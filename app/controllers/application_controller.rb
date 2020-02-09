# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :enail, :password, :password_confirmation])
  end
  
  def aftere_sign_out_path_for(resource_or_scope)
    root_path
  end
end
