Rails.application.routes.draw do
  
  resources :vehicle_stop_times
  get 'vehicle_realtimes/pull', to: 'vehicle_realtimes#pull'
  
  resources :vehicle_realtimes
  resources :vehicle_trips
  resources :vehicle_stops
  resources :vehicle_stop_times
  resources :vehicle_trips
  resources :vehicle_routes
  
  namespace :api do
    resources :vehicle_realtimes
    resources :vehicle_trips
    resources :vehicle_stops
    resources :vehicle_stop_times
    resources :vehicle_trips
    resources :vehicle_routes
  end
  
  devise_for :users
end
