FactoryGirl.define do
  factory :show_time do
    movie { Movie.first || association(:movie) }
    audi { Audi.first || association(:audi) }
    start_time Faker::Time.between(2.days.ago, Date.today, :all)
    run_time Faker::Time.between(2.days.ago, Date.today, :all)
  end
end
