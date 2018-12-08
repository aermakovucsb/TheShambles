class GamersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
	before_action :set_gamer, only: [:show, :edit, :update, :destroy]
	before_action :require_same_user, only: [:edit, :update, :destroy]
	before_action :require_admin, only: [:destroy]
	
	def index
  		@gamers = Gamer.paginate(page: params[:page], per_page: 5)
	end


	def new
		@gamer= Gamer.new
	end
	def create
		@gamer= Gamer.new(gamer_params)
		if @gamer.save
			session[:gamer_id] = @gamer.id
			flash[:success] = "Welcome #{@gamer.gamername} to gTrack"
			redirect_to gamer_path(@gamer)
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
    	
    end
    def update
    	
    	if @gamer.update(gamer_params)
      		flash[:success] = "Your account was updated successfully"
      		redirect_to @gamer
    	else
      		render 'edit'
    	end  
    end

    def destroy
	  if !@gamer.admin?
	  	@gamer.destroy
	  	flash[:danger] = "Gamer account has been deleted"
	  	redirect_to gamers_path
	  end
	end

private

def gamer_params
	params.require(:gamer).permit(:gamername, :email, :password, :password_confirmation)
end

def set_gamer
  @gamer = Gamer.find(params[:id])
end
  def require_same_user
    if current_gamer != @gamer and !current_gamer.admin?
      flash[:danger] = "You can only edit or delete your own account"
      redirect_to gamers_path
    end
  end

  def require_admin
  	if logged_in? && !current_gamer.admin?
  		flash[:danger]= "Only admin users can perform the action"
  		redirect_to root_path
  	end
  end


end
