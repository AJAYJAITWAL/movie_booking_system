class MoviesController < ApplicationController
  load_resource

  skip_before_action :authenticate_user!, only: %i(show index available_shows)
  before_action :set_movie, except: %i(index new)

  def index
    @movies = Movie.all
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def available_shows
    @available_theaters = Theater.joins(shows: :movie).where(movie: {id: @movie.id}, shows: { show_date: params[:date].to_date || Date.today }).uniq
    @available_dates = @movie.shows.where("show_date >= ?", Date.today)&.map(&:show_date)&.uniq
  end

  private

  def set_movie
    @movie = Movie.find(params[:id] || params[:movie_id])
  end

  def movie_params
    params.require(:movie).permit(:title, :genre, :image, :description)
  end
end
