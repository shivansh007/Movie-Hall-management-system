FactoryGirl.define do
  factory :seat do
    audi { Audi.first || association(:audi) }
    row_number Faker::Number.between(65, 90).chr
    seat_number Faker::Number.between(1, 14)
  end
end
