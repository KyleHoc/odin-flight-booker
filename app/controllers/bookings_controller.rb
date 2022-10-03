class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booked_flight = Flight.find(params[:flight_id])
    passenger_count = params[:passenger_count].to_i
    flight_id = params[:flight_id]
    passenger_count.times { @booking.passengers.build } #this line gives me an error, unknown attribute 'booking_id' for Passenger, but I'm not using a booking id for anything...
  end

  def create
    @booking = Booking.create(booking_params)
  end

  private
  def booking_params
    params.require(:booking).permit(:passenger_count, :flight_id, passenger_attributes: [:name, :email])
  end
end
