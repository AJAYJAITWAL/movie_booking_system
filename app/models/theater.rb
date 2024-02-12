class Theater < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :movies, through: :shows

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
