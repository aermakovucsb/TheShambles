class GamersController < ApplicationController

	def new
		@gamer= Gamer.new
	end
	def create
		@gamer= Gamer.new(gamer_params)
		if @gamer.save
			flash[:success] = "Welcome #{@gamer.gamername} to My Recipees App"
			redirect_to gamer_path(@gamer)
		else
			render 'new'
		end
	end

	def show
		@gamer= Gamer.find(params[:id])
	end

private

def gamer_params
	params.require(:gamer).permit(:gamername, :email, :password, :password_confirmation)
end


end