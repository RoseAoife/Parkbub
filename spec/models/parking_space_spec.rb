require 'rails_helper'

RSpec.describe ParkingSpace, type: :model do
  it "has a valid factory" do
    Factory.create(:parking_space).should be_valid
  end
  it "is invalid without a name"
  it "is invalid without a cost"
  it "is invalid without a address"
  it "is invalid without a description"
  it "is invalid without a user_id"
end
