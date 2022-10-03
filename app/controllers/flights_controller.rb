class FlightsController < ApplicationController

  def index
    @airport_options = Airport.all.map{ |a| [ a.code, a.id ]}
    @flight_options = Flight.all.map{ |f| [f.start_time, f.duration, f.departure_airport, f.arrival_airport]}
    @flights = Flight.where(departure_id: params[:departure_id], arrival_id: params[:arrival_id])
  end

  private
  def flight_params
    params.require(:flight).permit(:departure_id, :destination_id, :start_time)
  end
end