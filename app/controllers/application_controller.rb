class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  # before_filter :prepare_for_mobile
  before_filter :current_user

  helper_method :current_user_session, :current_user, :require_user, :mobile_device?

  layout :another_by_method

  private
  def another_by_method
    if current_user.nil?
      "logged_out"
    else
      "application"
    end
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_path
      return false
    end
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
end
