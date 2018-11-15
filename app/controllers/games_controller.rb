class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :like]
  before_action :require_user, except: [:index, :show, :like]
  before_action :require_user_like, only: [:like]

  # GET /games
  # GET /games.json
  def index
    @games = Game.paginate(page: params[:page], per_page: 100)
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @comment = Comment.new
    @comments = @game.comments.paginate(page: params[:page], per_page: 5)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
	# start for mtm
	params[:game][:genre_ids].each do |genre_id|
	  unless genre_id.empty?
	  genre = Genre.find(genre_id)
	    @game.genres << genre
	  end
	end
	# end for mtm
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  def like
    like = Like.create(like: params[:like], gamer: current_gamer, game: @game)
    if like.valid?
      flash[:success] = "Your selection was succesful"
      redirect_back fallback_location: root_path
    else
      flash[:danger] = "You can only like/dislike a game once"
      redirect_back fallback_location: root_path
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
	# start for mtm
	params[:game][:genre_ids].each do |genre_id|
	  unless genre_id.empty?
	  genre = Genre.find(genre_id)
	    @game.genres << genre
	  end
	end
	# end for mtm
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:steam_id, :name, :price, :release_date, :description, :image)
    end
    def require_user_like
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_back fallback_location: root_path
      end
    end

end
