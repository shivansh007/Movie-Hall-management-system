FactoryGirl.define do
  factory :booking do
    movie { Movie.first || association(:movie) }
    user { User.first || association(:user) }
    booking_time Faker::Time.between(2.days.ago, Date.today, :all)
  end
end
