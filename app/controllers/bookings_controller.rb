class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booked_flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count].to_i
    @flight_id = params[:flight_id]
    @passenger_count.times { @booking.passengers.build } 
  end

  def create
    @booking = Booking.create(booking_params)

    if @booking.save
      passengers = @booking.passengers
      passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).confirmation_email.deliver_now
      end
      redirect_to booking_path(@booking)
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:passenger_count, :flight_id, :id, passengers_attributes: [:name, :email])
  end
end
