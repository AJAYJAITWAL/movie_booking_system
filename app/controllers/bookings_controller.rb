class BookingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_show, only: %i(create)
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
    @show.available_seats = @show.available_seats - booking_params[:seat_numbers].size
    @show.save
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
    show = @booking.show
    show.available_seats = show.available_seats + @booking.seat_numbers.size
    show.save
    @booking.destroy!
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def my_bookings
    @my_bookings = current_user.bookings
  end

  private

  def set_show
    @show = Show.find(params[:booking][:show_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :show_id, :show_date, seat_numbers: [])
  end
end
