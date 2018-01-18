require 'rails_helper'

RSpec.describe ShowTime, type: :model do
  context 'validation' do
    it 'success' do
      @show_time = build(:show_time)
      @show_time.should be_valid
    end

    it 'fails when movie not present' do
      @show_time = build(:show_time, movie_id: '')
      @show_time.should_not be_valid
    end

    it 'fails when movie id not integer' do
      @show_time = build(:show_time, movie_id: 'a')
      @show_time.should_not be_valid
    end

    it 'fails when audi not present' do
      @show_time = build(:show_time, audi_id: '')
      @show_time.should_not be_valid
    end

    it 'fails when audi id not present' do
      @show_time = build(:show_time, audi_id: 'a')
      @show_time.should_not be_valid
    end

    it 'fails when start time not present' do
      @show_time = build(:show_time, start_time: '')
      @show_time.should_not be_valid
    end

    it 'fails when run time not present' do
      @show_time = build(:show_time, run_time: '')
      @show_time.should_not be_valid
    end
  end

  context 'assocaition' do
    it 'should belong to movie' do
      movie = create(:movie)
      show_time = create(:show_time, movie_id: movie.id)
      show_time.movie_id.should eq movie.id
    end

    it 'should belong to audi' do
      audi = create(:audi)
      show_time = create(:show_time, audi_id: audi.id)
      show_time.audi_id.should eq audi.id
    end
  end
end
