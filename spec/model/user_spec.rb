# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end
  end

  describe "associations" do
    it "has many bookings" do
      user = create(:user)
      expect(user).to respond_to(:bookings)
    end
  end

  describe "callbacks" do
    it "sets default role to user after initialization" do
      user = User.new
      expect(user.role).to eq("user")
    end
  end
end
