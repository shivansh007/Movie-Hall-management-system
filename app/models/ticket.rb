class Ticket < ActiveRecord::Base
  belongs_to :booking
  belongs_to :seat
  belongs_to :show_time
  validates :booking_id, presence: true, numericality: true
  validates :seat_id, presence: true, numericality: true
  validates :show_time_id, presence: true, numericality: true
end
