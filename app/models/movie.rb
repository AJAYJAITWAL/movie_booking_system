class Movie < ApplicationRecord
  validates :title, :genre, presence: true
end
