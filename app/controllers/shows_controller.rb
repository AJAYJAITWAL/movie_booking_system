class ShowsController < ApplicationController
  load_and_authorize_resource
  before_action :load_movies, only: %i(new edit)
  before_action :set_theater, only: %i(create update)

  def index
    @shows = params[:movie_id].present? ? Show.where(movie_id: params[:movie_id]) : Show.all 
  end

  def new
    @show = Show.new
  end

  def edit; end

  def create
    @show = Show.new(show_params)
    @show.total_seats = @theater.capacity
    @show.available_seats = @theater.capacity

    respond_to do |format|
      if @show.save
        format.html { redirect_to show_url(@show), notice: "Show was successfully created." }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to show_url(@show), notice: "Show was successfully updated." }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @show.destroy!

    respond_to do |format|
      format.html { redirect_to shows_url, notice: "Show was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def show_params
    params.require(:show).permit(:movie_id, :show_date, :start_time, :end_time, :theater_id)
  end

  def set_theater
    @theater = Theater.find(params[:show][:theater_id])
  end

  def load_movies
    @movies = Movie.all
    @theaters = Theater.all
  end
end
