Rails.application.routes.draw do
  resources :users
  resources :movies
  resources :movie_halls
  resources :audis
  resources :seats
  resources :bookings
  resources :tickets
  resources :show_times
end
