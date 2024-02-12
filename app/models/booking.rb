class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :user_id, :show_id, :seat_numbers, :show_date, presence: true
end
