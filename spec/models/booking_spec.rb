require 'rails_helper'

RSpec.describe Booking, type: :model do
  it "has a valid factory" do
    Factory.create(:booking).should be_valid
  end
  it "is invalid without a start_time"
  it "is invalid without a end_time"
  it "is invalid without a price"
  it "is invalid without a parking_space_id"
  it "is invalid without a user_id"
end
