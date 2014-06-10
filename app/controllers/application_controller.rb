class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_writer!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :current_password,:first_name,:last_name,:sex,:screen_name)}
  end


  private

  #Redirect to a specific page on successful sign in
  def after_sign_in_path_for(resource)
    invite_writers_home_index_path
  end

end
