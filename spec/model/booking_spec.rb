# spec/models/booking_spec.rb

require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:show) }
  end

  describe "validations" do
    subject { FactoryBot.build(:booking) }

    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:show_id) }
    it { should validate_presence_of(:seat_numbers) }
    it { should validate_presence_of(:show_date) }
  end
end
