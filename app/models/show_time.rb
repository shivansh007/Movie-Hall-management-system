class ShowTime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :audi
  validates :movie_id, presence: true, numericality: true
  validates :audi_id, presence: true, numericality: true
  validates :start_time, presence: true
  validates :run_time, presence: true
end
