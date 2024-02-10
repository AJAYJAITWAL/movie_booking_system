class Movie < ApplicationRecord
  has_one_attached :image

  validates :title, :genre, presence: true
end
