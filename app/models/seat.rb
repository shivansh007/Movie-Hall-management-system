class Seat < ActiveRecord::Base
  belongs_to :audi
  validates :audi_id, presence: true, numericality: true
  validates :row_number, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :seat_number, presence: true, numericality: true
end
