require 'rails_helper'

RSpec.describe ShowTimesController, type: :controller do
  context 'GET' do
    it 'all successfully' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'show_time successfully' do
      show_time = create(:show_time)
      get :show, id: show_time.id
      response.should have_http_status(:ok)
    end

    it 'show_time successfully' do
      get :show, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'POST' do
    it 'show_time successfully' do
      show_time = create(:show_time)
      post :create, show_time: { movie_id: show_time.movie_id, audi_id: show_time.audi_id, start_time: show_time.start_time, run_time: show_time.run_time }
      response.should have_http_status(:ok)
    end

    it 'show_time unsuccessfully' do
      post :create, show_time: { movie_id: '', audi_id: '', start_time: '', run_time: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'show_time successfully' do
      show_time = create(:show_time)
      put :update, id: show_time.id, show_time: { movie_id: show_time.movie_id, audi_id: show_time.audi_id, start_time: show_time.start_time, run_time: show_time.run_time }
      response.should have_http_status(:ok)
    end

    it 'show_time unsuccessfully' do
      show_time = create(:show_time)
      put :update, id: show_time.id, show_time: { movie_id: '', audi_id: '', start_time: '', run_time: '' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'show_time not found' do
      put :update, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE' do
    it 'show_time successfully' do
      show_time = create(:show_time)
      delete :destroy, id: show_time.id
      response.should have_http_status(:ok)
    end

    it 'show_time not found' do
      delete :destroy, id: 0
      response.should have_http_status(:not_found)
    end
  end
end
