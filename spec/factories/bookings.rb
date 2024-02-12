# spec/factories/bookings.rb

FactoryBot.define do
  factory :booking do
    user
    show
    seat_numbers { Faker::Number.between(from: 1, to: 10) }
    show_date { Faker::Date.forward(days: 10) }
  end
end
