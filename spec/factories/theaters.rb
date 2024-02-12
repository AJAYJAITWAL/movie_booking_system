# spec/factories/theaters.rb

FactoryBot.define do
  factory :theater do
    name { Faker::Company.name }
    location { Faker::Address.city }
    capacity { Faker::Number.between(from: 50, to: 500) }
  end
end
