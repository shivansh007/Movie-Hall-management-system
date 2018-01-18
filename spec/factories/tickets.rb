FactoryGirl.define do
  factory :ticket do
    booking { Booking.first || association(:booking) }
    seat { Seat.first || association(:seat) }
    show_time { ShowTime.first || association(:show_time) }
  end
end
