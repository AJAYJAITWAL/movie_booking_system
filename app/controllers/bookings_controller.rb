class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  def index
    @bookings = Booking.all
  end

  def show; end

  def new
    @booking = Booking.new
    @show = Show.find(params[:show_id])
    @booked_seat = Booking.all.where(show_id: @show.id)&.map(&:seat_numbers).reduce(:+)
  end

  def edit; end

  def create
    @booking = Booking.new(booking_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @booking.save
        format.html { redirect_to my_bookings_bookings_path, notice: "Booking was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def my_bookings
    @my_bookings = current_user.bookings
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :show_id, :show_date, seat_numbers: [])
    end
end
