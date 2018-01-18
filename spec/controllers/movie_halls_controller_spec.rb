require 'rails_helper'

RSpec.describe MovieHallsController, type: :controller do
  context 'GET' do
    it 'all successfully' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'movie_hall successfully' do
      movie_hall = create(:movie_hall)
      get :show, id: movie_hall.id
      response.should have_http_status(:ok)
    end

    it 'movie_hall not found' do
      get :show, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'POST' do
    it 'movie_hall successfully' do
      movie_hall = create(:movie_hall)
      post :create, movie_hall: { name: movie_hall.name, address: movie_hall.address, phone: movie_hall.phone }
      response.should have_http_status(:ok)
    end

    it 'movie_hall unsuccessfully' do
      post :create, movie_hall: { name: '', address: '', phone: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'movie_hall successfully' do
      movie_hall = create(:movie_hall)
      put :update, id: movie_hall.id, movie_hall: { name: movie_hall.name, address: movie_hall.address, phone: movie_hall.phone }
      response.should have_http_status(:ok)
    end

    it 'movie_hall unsuccessfully' do
      movie_hall = create(:movie_hall)
      put :update, id: movie_hall.id, movie_hall: { name: '', address: '', phone: '' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'movie_hall unsuccessfully' do
      put :update, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE' do
    it 'movie_hall successfully' do
      movie_hall = create(:movie_hall)
      delete :destroy, id: movie_hall.id
      response.should have_http_status(:ok)
    end

    it 'movie_hall successfully' do
      delete :destroy, id: 0
      response.should have_http_status(:not_found)
    end
  end
end
