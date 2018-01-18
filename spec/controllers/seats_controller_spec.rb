require 'rails_helper'

RSpec.describe SeatsController, type: :controller do
  context 'GET' do
    it 'all successfully' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'seat successfully' do
      seat = create(:seat)
      get :show, id: seat.id
      response.should have_http_status(:ok)
    end

    it 'seat not found' do
      get :show, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'POST' do
    it 'seat successfully' do
      seat = create(:seat)
      post :create, seat: { audi_id: seat.audi_id, row_number: seat.row_number, seat_number: seat.seat_number }
      response.should have_http_status(:ok)
    end

    it 'seat unsuccessfully' do
      post :create, seat: { audi_id: '', row_number: '', seat_number: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'seat successfully' do
      seat = create(:seat)
      put :update, id: seat.id, seat: { audi_id: seat.audi_id, row_number: seat.row_number, seat_number: seat.seat_number }
      response.should have_http_status(:ok)
    end

    it 'seat unsuccessfully' do
      seat = create(:seat)
      put :update, id: seat.id, seat: { audi_id: '', row_number: '', seat_number: '' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'seat not found' do
      put :update, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE' do
    it 'seat successfully' do
      seat = create(:seat)
      delete :destroy, id: seat.id
      response.should have_http_status(:ok)
    end

    it 'seat not found' do
      delete :destroy, id: 0
      response.should have_http_status(:not_found)
    end
  end
end
