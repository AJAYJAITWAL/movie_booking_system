class TheatersController < ApplicationController
  load_and_authorize_resource

  def index
    @theaters = Theater.all
  end

  def show
  end

  def new
    @theater = Theater.new
  end

  def edit
  end

  def create
    @theater = Theater.new(theater_params)

    respond_to do |format|
      if @theater.save
        format.html { redirect_to theater_url(@theater), notice: "Theater was successfully created." }
        format.json { render :show, status: :created, location: @theater }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @theater.update(theater_params)
        format.html { redirect_to theater_url(@theater), notice: "Theater was successfully updated." }
        format.json { render :show, status: :ok, location: @theater }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @theater.destroy!

    respond_to do |format|
      format.html { redirect_to theaters_url, notice: "Theater was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def theater_params
    params.require(:theater).permit(:name, :location, :capacity)
    end
end
