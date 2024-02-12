class Movie < ApplicationRecord
  has_one_attached :image
  has_many :shows, dependent: :destroy
  has_many :theaters, through: :shows

  validates :title, presence: true, uniqueness: true
  validates :genre, :description, presence: true
end
