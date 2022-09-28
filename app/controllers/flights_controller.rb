class FlightsController < ApplicationController

  def index
    @airport_options = Airport.all.map{ |a| [ a.code, a.id ]}
    @flight_options = Flight.all.map{ |f| [f.start_time, f.duration, f.departure_airport, f.arrival_airport]}
  end
end
