Rails.application.routes.draw do
  
  resources :vehicle_stop_times
  get 'vehicle_realtimes/pull', to: 'vehicle_realtimes#pull'
  
  resources :vehicle_realtimes
  resources :vehicle_stops
  resources :vehicle_stop_times
  resources :vehicle_trips
  resources :vehicle_routes
  
  namespace :api do
    resources :vehicle_realtimes
    resources :vehicle_stops
    resources :vehicle_stop_times
  
    get 'vehicle_trips/search', to: 'vehicle_trips#search'
    
    resources :vehicle_trips
    resources :vehicle_routes
  end
  
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
