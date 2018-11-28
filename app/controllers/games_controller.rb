class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_game, only: [:show, :edit, :update, :destroy, :like]
  before_action :require_user, except: [:index, :show, :like]
  before_action :require_admin, only: [:create, :new, :edit, :update, :destroy]
  before_action :require_user_like, only: [:like]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all.paginate(page: params[:page], per_page: 100)
    #@games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    fresh_when last_modified: @game.updated_at
    @comment = Comment.new
    @comments = @game.comments.paginate(page: params[:page], per_page: 5)
    #@comments = @game.comments
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
	# start for mtm - many to many
	if params[:game][:genre_ids]
	  params[:game][:genre_ids].each do |genre_id|
	    unless genre_id.empty?
	      genre = Genre.find(genre_id)
	      @game.genres << genre
	    end
	  end
	end
	if params[:game][:company_ids]
	  params[:game][:company_ids].each do |company_id|
	    unless company_id.empty?
	      company = Company.find(company_id)
	      @game.companies << company
	    end
	  end
	end
	# end for mtm
	processor_id = params[:game][:processor_id]
	memory_id = params[:game][:memory_id]
	graphic_id = params[:game][:graphic_id]
	if (processor_id != 0) and (memory_id != 0) and (graphic_id != 0)
	  @game.system_requirement = SystemRequirement.new({processor_id: processor_id, memory_id: memory_id, graphic_id: graphic_id})
	else
	  @game.system_requirement = SystemRequirement.new({processor_id: 1, memory_id: 1, graphic_id: 1})
	end
	@game.system_requirement.save()
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
	@game.genres.delete_all
	if params[:game][:genre_ids]
	  params[:game][:genre_ids].each do |genre_id|
	    unless genre_id.empty?
	      genre = Genre.find(genre_id)
	      @game.genres << genre
	    end
	  end
	end
	@game.companies.delete_all
	if params[:game][:company_ids]
	  params[:game][:company_ids].each do |company_id|
	    unless company_id.empty?
	      company = Company.find(company_id)
	      @game.companies << company
	    end
	  end
	end
	# end for mtm
	processor_id = params[:game][:processor_id]
	memory_id = params[:game][:memory_id]
	graphic_id = params[:game][:graphic_id]
	sys_req = @game.system_requirement
	if processor_id != 0
	  sys_req.processor_id = processor_id
	end
	if memory_id != 0
	  sys_req.memory_id = memory_id
	end
	if graphic_id != 0
	  sys_req.graphic_id = graphic_id
	end
	sys_req.save
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
