# spec/factories/shows.rb

FactoryBot.define do
  factory :show do
    movie
    theater
    start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1) }
    end_time { start_time + 2.hours }
    total_seats { Faker::Number.between(from: 50, to: 200) }
  end
end
