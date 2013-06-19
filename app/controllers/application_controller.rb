class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # helper method to check if the user is logged in.
  # returns eiter the user object or nil.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
    
  private
  
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
    end
  end

end
