class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  helper_method :current_gamer, :logged_in?, :require_admin

  def current_gamer
    @current_gamer ||= Gamer.find(session[:gamer_id]) if session[:gamer_id]
  end

  def logged_in?
    !!current_gamer
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def require_admin
    if !logged_in?
      flash[:danger] = "You must be admin to perform that action"
      redirect_to root_path
    else
      if current_gamer.admin == false
	flash[:danger] = "You must be admin to perform that action"
	redirect_to root_path
      end
    end
  end


  protected
  
  def resource_not_found
  end

  	
end
