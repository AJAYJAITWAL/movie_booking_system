# spec/models/show_spec.rb

require 'rails_helper'

RSpec.describe Show, type: :model do
  describe "associations" do
    it { should belong_to(:movie) }
    it { should belong_to(:theater) }
  end

  describe "validations" do
    subject { FactoryBot.build(:show) }

    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:total_seats) }
    it { should validate_numericality_of(:total_seats).only_integer.is_greater_than(0) }

    it "validates that end time is after start time" do
      show = FactoryBot.build(:show, start_time: Time.now, end_time: Time.now - 1.hour)
      expect(show).not_to be_valid
      expect(show.errors[:end_time]).to include("must be after start time")
    end
  end
end
