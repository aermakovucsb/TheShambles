class SessionsController < ApplicationController

	def new
  # will simply render the form
  	end

  	def create
    	gamer = Gamer.find_by(email: params[:session][:email].downcase)
    	if gamer && gamer.authenticate(params[:session][:password])
      		session[:gamer_id] = gamer.id
      		session[:user_type] = gamer.user_type
      		flash[:success] = "You have successfully logged in"
      		redirect_to gamer
    	else
    		flash.now[:danger] = "There was something wrong with your login information"
      		render 'new'
    	end
  end

  	def destroy
  		session[:gamer_id] = nil
      		session[:user_type] = nil
		flash[:success] = "You have logged out"
    	redirect_to root_path
  	end

end 



