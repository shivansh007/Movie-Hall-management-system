class Booking < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  validates :movie_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true
  validates :booking_time, presence: true
end
