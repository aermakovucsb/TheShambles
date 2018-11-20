class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
	def home
		redirect_to games_path if logged_in?
	end
end
