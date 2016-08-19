class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :navbar_categories
  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :phone_number, :gender, :email, :password, :password_confirmation, :remember_me, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def navbar_categories
  	@nav_categories = Category.all
  end
end
