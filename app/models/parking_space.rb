class ParkingSpace < ApplicationRecord
    belongs_to :user
    has_many :bookings, dependent: :destroy
    validates :name, :address, :cost, :user_id, presence: true
end
