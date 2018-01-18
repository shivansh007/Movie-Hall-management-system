class Audi < ActiveRecord::Base
  has_many :seats
  has_many :show_times
  belongs_to :movie_hall
  validates :movie_hall_id, presence: true, numericality: true
  validates :audi_no, presence: true, numericality: true
end
