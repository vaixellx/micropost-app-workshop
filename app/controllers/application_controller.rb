class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_session

  def current_user_session
    return @current_user_session if @current_user_session
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if @current_user
    @current_user = current_user_session && current_user_session.record
  end
end
