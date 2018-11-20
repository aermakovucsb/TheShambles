class ChatroomsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
	before_action :require_user
	def show
		@message= Message.new
		@messages= Message.most_recent
	end


end
