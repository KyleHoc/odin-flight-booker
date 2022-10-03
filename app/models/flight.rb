class Flight < ApplicationRecord
    belongs_to :departure_airport, foreign_key: "departure_id", class_name: "Airport"
    belongs_to :arrival_airport, foreign_key: "arrival_id", class_name: "Airport"
    has_many :passengers, through: :bookings

    def self.get_start_time
        start_time = Flight.find_by_sql("select distinct start_time from flights where start_time is not null order by start_time desc")
      end 

    def start_time_formatted
        start_time.strftime("%m/%d/%Y")
    end    
end
