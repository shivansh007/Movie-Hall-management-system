FactoryGirl.define do
  factory :movie do
    name Faker::Movie.quote
    release_date Faker::Date.between(2.days.ago, Date.today)
    cast Faker::Name.name
  end
end
