FactoryGirl.define do
  factory :user do
    name Faker::GameOfThrones.character
    phone Faker::PhoneNumber.cell_phone
    email Faker::Internet.email
  end
end
