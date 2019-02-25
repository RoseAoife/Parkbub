class Booking < ApplicationRecord
    belongs_to :parking_space
    belongs_to :user
    validates :start_time, :end_time, :price, :parking_space_id, :user_id, presence: true
end
