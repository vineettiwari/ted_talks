class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def authenticate_user!
    unless current_user.present?
      redirect_to new_session_path
    end
  end

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?
end
