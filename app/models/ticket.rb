class Ticket < ActiveRecord::Base
  belongs_to :booking
  belongs_to :show_time
  belongs_to :seat
end
