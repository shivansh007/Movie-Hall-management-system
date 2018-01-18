require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'validation' do
    it 'success' do
      @ticket = build(:ticket)
      @ticket.should be_valid
    end

    it 'fails when booking not present' do
      @ticket = build(:ticket, booking_id: '')
      @ticket.should_not be_valid
    end

    it 'fails when booking id not integer' do
      @ticket = build(:ticket, booking_id: 'a')
      @ticket.should_not be_valid
    end

    it 'fails when seat not present' do
      @ticket = build(:ticket, seat_id: '')
      @ticket.should_not be_valid
    end

    it 'fails when seat id not integer' do
      @ticket = build(:ticket, seat_id: 'a')
      @ticket.should_not be_valid
    end

    it 'fails when show time not present' do
      @ticket = build(:ticket, show_time_id: '')
      @ticket.should_not be_valid
    end

    it 'fails when show time id not integer' do
      @ticket = build(:ticket, show_time_id: 'a')
      @ticket.should_not be_valid
    end
  end

  context 'assocaition' do
    it 'should belong to booking' do
      booking = create(:booking)
      ticket = create(:ticket, booking_id: booking.id)
      ticket.booking_id.should eq booking.id
    end

    it 'should belong to seat' do
      seat = create(:seat)
      ticket = create(:ticket, seat_id: seat.id)
      ticket.seat_id.should eq seat.id
    end

    it 'should belong to show time' do
      show_time = create(:show_time)
      ticket = create(:ticket, show_time_id: show_time.id)
      ticket.show_time_id.should eq show_time.id
    end
  end
end
