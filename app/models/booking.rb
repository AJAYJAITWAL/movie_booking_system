class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :user_id, presence: true
  validates :show_id, presence: true
  validates :seat_numbers, presence: true
  validates :show_date, presence: true
end
