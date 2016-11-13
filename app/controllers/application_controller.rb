class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  include SessionsHelper

  private
    def authenticate
      return if logged_in?
      flash[:warning] = 'Please login'
      redirect_to root_path
    end
end
