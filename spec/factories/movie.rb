# spec/factories/movies.rb

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    genre { "test" }
    description { Faker::Lorem.paragraph }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'animal.jpg'), 'image/jpeg') }
  end
end
