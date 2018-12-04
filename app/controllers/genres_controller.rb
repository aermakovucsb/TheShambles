class GenresController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:create, :new, :edit, :update, :destroy]

  # GET /genres
  # GET /genres.json
  def index
	  @genres = Genre.all
	  @counts = ActiveRecord::Base.connection.execute('select count(*) from games_genres group by genre_id order by genre_id').values
  end

  # GET /genres/1
  # GET /genres/1.json
  def show
  end

  # GET /genres/new
  def new
    @genre = Genre.new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres
  # POST /genres.json
  def create
    @genre = Genre.new(genre_params)

    respond_to do |format|
      if @genre.save
	# start for mtm
	params[:genre][:genre_ids].each do |genre_id|
	  unless genre_id.empty?
	  genre = Genre.find(genre_id)
	    @genre.genres << genre
	  end
	end
	# end for mtm
        format.html { redirect_to @genre, notice: 'Genre was successfully created.' }
        format.json { render :show, status: :created, location: @genre }
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    respond_to do |format|
      if @genre.update(genre_params)
	# start for mtm
	params[:genre][:genre_ids].each do |genre_id|
	  unless genre_id.empty?
	  genre = Genre.find(genre_id)
	    @genre.genres << genre
	  end
	end
	# end for mtm
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_params
      params.require(:genre).permit(:steam_id, :name, :price, :release_date, :description, :image)
    end
end
