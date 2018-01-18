FactoryGirl.define do
  factory :movie_hall do
    name Faker::Company.name
    address Faker::Address.street_address
    phone Faker::PhoneNumber.cell_phone
  end
end
