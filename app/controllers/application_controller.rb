class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  
  protected
  
  def resource_not_found
  end

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
end
