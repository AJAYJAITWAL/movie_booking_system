class ShowsController < ApplicationController
  load_and_authorize_resource
  before_action :load_movies, only: %i(new edit)

  def index
    @shows = params[:movie_id].present? ? Show.where(movie_id: params[:movie_id]) : Show.all 
  end

  def new
    @show = Show.new
  end

  def edit; end

  def create
    @show = Show.new(show_params)

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
    params.require(:show).permit(:movie_id, :start_time, :end_time, :total_seats)
  end

  def load_movies
    @movies = Movie.all
  end
end
