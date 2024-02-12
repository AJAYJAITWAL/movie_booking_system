class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theater

  validates :movie_id, :start_time, :end_time, presence: true
  validates :total_seats, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return unless start_time && end_time

    errors.add(:end_time, "must be after start time") if end_time <= start_time
  end
end
