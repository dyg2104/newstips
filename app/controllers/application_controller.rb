class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def sign_in!(user)
    session[:token] = user.reset_session_token!
  end

  def sign_out!
    current_user.reset_session_token!
    session[:token] = nil
    @current_user = nil
  end

  def signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

end
