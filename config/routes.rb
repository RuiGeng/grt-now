Rails.application.routes.draw do
  
  resources :vehicle_stop_times, only: [:index, :show, :edit, :update, :destroy]
  get 'vehicle_realtimes/pull', to: 'vehicle_realtimes#pull'
  
  resources :vehicle_realtimes, only: [:index, :show, :edit, :update, :destroy]
  resources :vehicle_stops, only: [:index, :show, :edit, :update, :destroy]
  resources :vehicle_stop_times, only: [:index, :show, :edit, :update, :destroy]
  resources :vehicle_trips, only: [:index, :show, :edit, :update, :destroy]
  resources :vehicle_routes, only: [:index, :show, :edit, :update, :destroy]
  
  namespace :api do
    resources :vehicle_realtimes, only: [:index, :show, :edit, :update, :destroy]
    resources :vehicle_stops, only: [:index, :show, :edit, :update, :destroy]
    resources :vehicle_stop_times, only: [:index, :show, :edit, :update, :destroy]
  
    get 'vehicle_trips/search', to: 'vehicle_trips#search'
    
    resources :vehicle_trips, only: [:index, :show, :edit, :update, :destroy]
    resources :vehicle_routes, only: [:index, :show, :edit, :update, :destroy]
  end
  
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  
  root      "home#index"
end
