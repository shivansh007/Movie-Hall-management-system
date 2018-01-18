require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  context 'GET' do
    it 'all successfully' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'movie successfully' do
      movie = create(:movie)
      get :show, id: movie.id
      response.should have_http_status(:ok)
    end

    it 'movie successfully' do
      get :show, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'POST' do
    it 'movie successfully' do
      movie = create(:movie)
      post :create, movie: { name: movie.name, release_date: movie.release_date, cast: movie.cast }
      response.should have_http_status(:ok)
    end

    it 'movie unsuccessfully' do
      post :create, movie: { name: '', release_date: '', cast: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'movie successfully' do
      movie = create(:movie)
      put :update, id: movie.id, movie: { name: movie.name, release_date: movie.release_date, cast: movie.cast }
      response.should have_http_status(:ok)
    end

    it 'movie unsuccessfully' do
      movie = create(:movie)
      put :update, id: movie.id, movie: { name: '', release_date: '', cast: '' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'movie not found' do
      put :update, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE' do
    it 'movie successfully' do
      movie = create(:movie)
      delete :destroy, id: movie.id
      response.should have_http_status(:ok)
    end

    it 'movie not found' do
      delete :destroy, id: 0
      response.should have_http_status(:not_found)
    end
  end
end
