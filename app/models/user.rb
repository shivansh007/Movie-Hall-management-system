class User < ActiveRecord::Base
  has_many :bookings
  validates :name, presence: true
  validates :phone, presence: true, length: { minimum: 6, maximum: 15 }
  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/ }
end
