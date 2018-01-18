require 'rails_helper'

RSpec.describe Booking, type: :model do
  context 'validation' do
    it 'success' do
      @booking = build(:booking)
      @booking.should be_valid
    end

    it 'fails when movie not present' do
      @booking = build(:booking, movie_id: '')
      @booking.should_not be_valid
    end

    it 'fails when movie id not an integer' do
      @audi = build(:booking, movie_id: 'a')
      @audi.should_not be_valid
    end

    it 'fails when user not present' do
      @booking = build(:booking, user_id: '')
      @booking.should_not be_valid
    end

    it 'fails when user id not an integer' do
      @audi = build(:booking, user_id: 'a')
      @audi.should_not be_valid
    end

    it 'fails when booking time not present' do
      @booking = build(:booking, booking_time: '')
      @booking.should_not be_valid
    end
  end

  context 'association' do
    it 'should belong to movie' do
      movie = create(:movie)
      booking = create(:booking, movie_id: movie.id)
      booking.movie.id.should eq movie.id
    end

    it 'should belong to movie' do
      user = create(:user)
      booking = create(:booking, user_id: user.id)
      booking.user.id.should eq user.id
    end
  end
end
