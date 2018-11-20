class EmotesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_emote, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:create, :new, :edit, :update, :destroy]

  # GET /emotes
  # GET /emotes.json
  def index
    @emotes = Emote.all
  end

  # GET /emotes/1
  # GET /emotes/1.json
  def show
  end

  # GET /emotes/new
  def new
    @emote = Emote.new
  end

  # GET /emotes/1/edit
  def edit
  end

  # POST /emotes
  # POST /emotes.json
  def create
    @emote = Emote.new(emote_params)

    respond_to do |format|
      if @emote.save
        game = Game.find(params[:emote][:game_id])
	game.emotes << @emote
        format.html { redirect_to @emote, notice: 'Emote was successfully created.' }
        format.json { render :show, status: :created, location: @emote }
      else
        format.html { render :new }
        format.json { render json: @emote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emotes/1
  # PATCH/PUT /emotes/1.json
  def update
    respond_to do |format|
      if @emote.update(emote_params)
        format.html { redirect_to @emote, notice: 'Emote was successfully updated.' }
        format.json { render :show, status: :ok, location: @emote }
      else
        format.html { render :edit }
        format.json { render json: @emote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emotes/1
  # DELETE /emotes/1.json
  def destroy
    @emote.destroy
    respond_to do |format|
      format.html { redirect_to emotes_url, notice: 'Emote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emote
      @emote = Emote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emote_params
      params.require(:emote).permit(:name, :price, :image, :game_id)
    end
end
