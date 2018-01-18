require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  context 'GET' do
    it 'all successfully' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'booking successfully' do
      booking = create(:booking)
      get :show, id: booking.id
      response.should have_http_status(:ok)
    end

    it 'booking not found' do
      get :show, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'POST' do
    it 'booking successfully' do
      booking = create(:booking)
      post :create, booking: { movie_id: booking.movie_id, user_id: booking.user_id, booking_time: booking.booking_time }
      response.should have_http_status(:ok)
    end

    it 'booking unsuccessfully' do
      post :create, booking: { movie_id: '', user_id: '', booking_time: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'booking successfully' do
      booking = create(:booking)
      put :update, id: booking.id, booking: { movie_id: booking.movie_id, user_id: booking.user_id, booking_time: booking.booking_time }
      response.should have_http_status(:ok)
    end

    it 'booking unsuccessfully' do
      booking = create(:booking)
      put :update, id: booking.id, booking: { movie_id: '', user_id: '', booking_time: '' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'booking not found' do
      put :update, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE' do
    it 'booking successfully' do
      booking = create(:booking)
      delete :destroy, id: booking.id
      response.should have_http_status(:ok)
    end
    it 'booking not found' do
      delete :destroy, id: 0
      response.should have_http_status(:not_found)
    end
  end
end
