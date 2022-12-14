class Passenger < ApplicationRecord
    has_many :flights, through: :bookings
    has_many :bookings
    validates :name, presence: true
    validates :email, presence: true
end
