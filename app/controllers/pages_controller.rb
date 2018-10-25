class PagesController < ApplicationController
	def home
		redirect_to games_path if logged_in?
	end
end