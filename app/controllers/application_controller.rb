class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private  #PRIVATE PRIVATE PRIVATE
  
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized. Please login." if current_user.nil?
  end
end
