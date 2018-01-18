require 'rails_helper'

RSpec.describe Audi, type: :model do
  context 'validation' do
    it 'success' do
      @audi = build(:audi)
      @audi.should be_valid
    end

    it 'fails when movie hall not present' do
      @audi = build(:audi, movie_hall_id: '')
      @audi.should_not be_valid
    end

    it 'fails when movie hall not an integer' do
      @audi = build(:audi, movie_hall_id: 'a')
      @audi.should_not be_valid
    end

    it 'fails when audi number not present' do
      @audi = build(:audi, audi_no: '')
      @audi.should_not be_valid
    end

    it 'fails when audi number not an integer' do
      @audi = build(:audi, audi_no: 'a')
      @audi.should_not be_valid
    end
  end

  context 'association' do
    it 'should belong to movie hall' do
      movie_hall = create(:movie_hall)
      audi = create(:audi, movie_hall_id: movie_hall.id)
      audi.movie_hall.id.should eq movie_hall.id
    end

    it 'should have many seats' do
      audi = create(:audi)
      seat1 = create(:seat, audi_id: audi.id)
      seat2 = create(:seat, audi_id: audi.id)
      seat1.audi_id.should(eq audi.id) && seat2.audi_id.should(eq audi.id)
    end

    it 'should have many show times' do
      audi = create(:audi)
      showtime1 = create(:show_time, audi_id: audi.id)
      showtime2 = create(:show_time, audi_id: audi.id)
      showtime1.audi_id.should(eq audi.id) && showtime2.audi_id.should(eq audi.id)
    end
  end
end
