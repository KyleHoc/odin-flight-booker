class Flight < ApplicationRecord
    belongs_to :departure_airport, foreign_key: "departure_id", class_name: "Airport"
    belongs_to :arrival_airport, foreign_key: "arrival_id", class_name: "Airport"

    def self.get_start_time
        start_time = flight.find_by_sql("select distinct start_time from departure_airport.flights where start_time is not null order by event_date desc")
      end 

    def start_time_formatted
        start_time.strftime("%m/%d/%Y")
    end    
end
