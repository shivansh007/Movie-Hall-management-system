require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context 'GET' do
    it 'all successfully' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'ticket successfully' do
      ticket = create(:ticket)
      get :show, id: ticket.id
      response.should have_http_status(:ok)
    end

    it 'ticket not found' do
      get :show, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'POST' do
    it 'ticket successfully' do
      ticket = create(:ticket)
      post :create, ticket: { booking_id: ticket.booking_id, seat_id: ticket.seat_id, show_time_id: ticket.show_time_id }
      response.should have_http_status(:ok)
    end

    it 'ticket unsuccessfully' do
      post :create, ticket: { booking_id: '', seat_id: '', show_time_id: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'ticket successfully' do
      ticket = create(:ticket)
      put :update, id: ticket.id, ticket: { booking_id: ticket.booking_id, seat_id: ticket.seat_id, show_time_id: ticket.show_time_id }
      response.should have_http_status(:ok)
    end

    it 'ticket unsuccessfully' do
      ticket = create(:ticket)
      put :update, id: ticket.id, ticket: { booking_id: '', seat_id: '', show_time_id: '' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'ticket not found' do
      put :update, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE' do
    it 'ticket successfully' do
      ticket = create(:ticket)
      delete :destroy, id: ticket.id
      response.should have_http_status(:ok)
    end

    it 'ticket not found' do
      delete :destroy, id: 0
      response.should have_http_status(:not_found)
    end
  end
end
