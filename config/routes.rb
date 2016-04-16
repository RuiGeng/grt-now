Rails.application.routes.draw do
  
  get 'vehicle_realtimes/pull', to: 'vehicle_realtimes#pull'
  
  resources :vehicle_realtimes
  resources :vehicle_trips
  resources :vehicle_stop_times
  resources :vehicle_stops
  resources :vehicle_routes
  
  devise_for :users
end
