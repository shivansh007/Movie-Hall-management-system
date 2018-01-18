require 'rails_helper'

RSpec.describe MovieHall, type: :model do
  context 'validation' do
    it 'success' do
      @movie_hall = build(:movie_hall)
      @movie_hall.should be_valid
    end

    it 'fails when name not present' do
      @movie_hall1 = build(:movie_hall, name: '')
      @movie_hall1.should_not be_valid
    end

    it 'fails when address not present' do
      @movie_hall1 = build(:movie_hall, address: '')
      @movie_hall1.should_not be_valid
    end

    it 'fails when phone not present' do
      @movie_hall1 = build(:movie_hall, phone: '')
      @movie_hall1.should_not be_valid
    end

    it 'fails when phone number length is less than 6' do
      @movie_hall1 = build(:movie_hall, phone: '11111')
      @movie_hall1.should_not be_valid
    end

    it 'fails when phone number length is more than 15' do
      @movie_hall1 = build(:movie_hall, phone: '1111111111111111')
      @movie_hall1.should_not be_valid
    end
  end

  context 'association' do
    it 'should have many audis' do
      movie_hall = create(:movie_hall)
      audi1 = create(:audi, movie_hall_id: movie_hall.id)
      audi2 = create(:audi, movie_hall_id: movie_hall.id)
      [audi1.movie_hall_id, audi2.movie_hall_id].include?(movie_hall.id).should be_truthy
    end
  end
end
