class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user
  helper_method :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:original_request_path] = request.fullpath
      return redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end

    cookies[:email] = current_user.email
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
