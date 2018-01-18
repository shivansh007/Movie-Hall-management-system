class MovieHall < ActiveRecord::Base
  has_many :audis
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true, length: { minimum: 6, maximum: 15 }
end
