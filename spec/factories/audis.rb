FactoryGirl.define do
  factory :audi do
    movie_hall { MovieHall.first || association(:movie_hall) }
    audi_no Faker::Number.between(1, 4)
  end
end
