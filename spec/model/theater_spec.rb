# spec/models/theater_spec.rb

require 'rails_helper'

RSpec.describe Theater, type: :model do
  describe "associations" do
    it { should have_many(:shows).dependent(:destroy) }
    it { should have_many(:movies).through(:shows) }
  end

  describe "validations" do
    subject { FactoryBot.build(:theater) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:capacity) }
    it { should validate_numericality_of(:capacity).only_integer.is_greater_than(0) }
  end
end
