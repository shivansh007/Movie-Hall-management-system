require 'rails_helper'

RSpec.describe AudisController, type: :controller do
  context 'GET' do
    it 'all successfully' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'audi successfully' do
      audi = create(:audi)
      get :show, id: audi.id
      response.should have_http_status(:ok)
    end

    it 'audi not found' do
      get :show, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'POST' do
    it 'audi successfully' do
      audi = create(:audi)
      post :create, audi: { movie_hall_id: audi.movie_hall_id, audi_no: audi.audi_no }
      response.should have_http_status(:ok)
    end

    it 'audi unsuccessfully' do
      post :create, audi: { movie_hall_id: '', audi_no: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'audi successfully' do
      audi = create(:audi)
      put :update, id: audi.id, audi: { movie_hall_id: audi.movie_hall_id, audi_no: audi.audi_no }
      response.should have_http_status(:ok)
    end

    it 'audi unsuccessfully' do
      audi = create(:audi)
      put :update, id: audi.id, audi: { movie_hall_id: '', audi_no: '' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'audi not found' do
      put :update, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE' do
    it 'audi successfully' do
      audi = create(:audi)
      delete :destroy, id: audi.id
      response.should have_http_status(:ok)
    end

    it 'audi not found' do
      delete :destroy, id: 0
      response.should have_http_status(:not_found)
    end
  end
end
