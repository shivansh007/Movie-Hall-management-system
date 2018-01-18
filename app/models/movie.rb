class Movie < ActiveRecord::Base
  has_many :bookings
  has_many :show_times
  validates :name, presence: true
  validates :release_date, presence: true
  validates :cast, presence: true
end
