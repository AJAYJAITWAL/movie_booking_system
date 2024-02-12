# spec/models/movie_spec.rb

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "associations" do
    it { should have_one_attached(:image) }
    it { should have_many(:shows).dependent(:destroy) }
    it { should have_many(:theaters).through(:shows) }
  end

  describe "validations" do
    subject { FactoryBot.build(:movie) }

    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:description) }
  end
end
