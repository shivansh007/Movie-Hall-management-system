require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'validation' do
    it 'success' do
      @movie = build(:movie)
      @movie.should be_valid
    end

    it 'fails when name not present' do
      @movie = build(:movie, name: '')
      @movie.should_not be_valid
    end

    it 'fails when release date not present' do
      @movie = build(:movie, release_date: '')
      @movie.should_not be_valid
    end

    it 'fails when cast not present' do
      @movie = build(:movie, cast: '')
      @movie.should_not be_valid
    end
  end

  context 'association' do
    it 'should have many bookings' do
      movie = create(:movie)
      booking1 = create(:booking, movie_id: movie.id)
      booking2 = create(:booking, movie_id: movie.id)
      booking1.movie_id.should(eq movie.id) && booking2.movie_id.should(eq movie.id)
    end

    it 'should have many show times' do
      movie = create(:movie)
      showtime1 = create(:show_time, movie_id: movie.id)
      showtime2 = create(:show_time, movie_id: movie.id)
      showtime1.movie_id.should(eq movie.id) && showtime2.movie_id.should(eq movie.id)
    end
  end
end
