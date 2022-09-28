# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.transaction do
    Flight.destroy_all
    Airport.destroy_all

    airports = []
    airports[0] = Airport.create(code: "CHS")
    airports[1] = Airport.create(code: "LAX")
    airports[2] = Airport.create(code: "AUS")
    airports[3] = Airport.create(code: "JFK")

    Flight.create(departure_airport: airports[0], arrival_airport: airports[1], start_time: "2022-10-12", duration: 280)
    Flight.create(departure_airport: airports[0], arrival_airport: airports[2], start_time: "2022-10-18", duration: 140)
    Flight.create(departure_airport: airports[0], arrival_airport: airports[3], start_time: "2022-10-16", duration: 380)
    Flight.create(departure_airport: airports[1], arrival_airport: airports[0], start_time: "2022-10-13", duration: 280)
    Flight.create(departure_airport: airports[1], arrival_airport: airports[2], start_time: "2022-10-12", duration: 180)
    Flight.create(departure_airport: airports[0], arrival_airport: airports[1], start_time: "2022-10-25", duration: 180)
    Flight.create(departure_airport: airports[3], arrival_airport: airports[1], start_time: "2022-10-12", duration: 380)
    Flight.create(departure_airport: airports[2], arrival_airport: airports[1], start_time: "2022-10-10", duration: 180)
    Flight.create(departure_airport: airports[2], arrival_airport: airports[3], start_time: "2022-10-17", duration: 280)
end