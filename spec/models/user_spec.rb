require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    Factory.create(:user).should be_valid
  end
  it "is invalid without a usernamename"
  it "is invalid without a password"
  it "is invalid without a email"
end
