require 'rails_helper'

RSpec.describe Seat, type: :model do
  context 'validation' do
    it 'success' do
      @seat = build(:seat)
      @seat.should be_valid
    end

    it 'fails when audi not present' do
      @seat = build(:seat, audi_id: '')
      @seat.should_not be_valid
    end

    it 'fails when audi number not integer' do
      @seat = build(:seat, audi_id: 'a')
      @seat.should_not be_valid
    end

    it 'fails when row number not present' do
      @seat = build(:seat, row_number: '')
      @seat.should_not be_valid
    end

    it 'fails when row number not a single character' do
      @seat = build(:seat, row_number: '2')
      @seat.should_not be_valid
    end

    it 'fails when seat number not present' do
      @seat = build(:seat, seat_number: '')
      @seat.should_not be_valid
    end

    it 'fails when seat number not integer' do
      @seat = build(:seat, seat_number: 'a')
      @seat.should_not be_valid
    end
  end

  context 'assocaition' do
    it 'should belong to audi' do
      audi = create(:audi)
      seat = create(:seat, audi_id: audi.id)
      seat.audi_id.should eq audi.id
    end
  end
end
