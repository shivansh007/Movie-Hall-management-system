require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET' do
    it 'all successfully' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'user successfully' do
      user = create(:user)
      get :show, id: user.id
      response.should have_http_status(:ok)
    end

    it 'user not found' do
      get :show, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'POST' do
    it 'user successfully' do
      user = create(:user)
      post :create, user: { name: user.name, phone: user.phone, email: user.email }
      response.should have_http_status(:ok)
    end

    it 'user unsuccessfully' do
      post :create, user: { name: '', phone: '', email: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'user successfully' do
      user = create(:user)
      put :update, id: user.id, user: { name: user.name, phone: user.phone, email: user.email }
      response.should have_http_status(:ok)
    end

    it 'user unsuccessfully' do
      user = create(:user)
      put :update, id: user.id, user: { name: '', phone: '', email: '' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'user not found' do
      put :update, id: 0
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE' do
    it 'user successfully' do
      user = create(:user)
      delete :destroy, id: user.id
      response.should have_http_status(:ok)
    end

    it 'user not found' do
      delete :destroy, id: 0
      response.should have_http_status(:not_found)
    end
  end
end
