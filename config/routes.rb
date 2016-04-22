Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :vehicle_stop_times
  get 'vehicle_realtimes/pull', to: 'vehicle_realtimes#pull'
  
  resources :vehicle_realtimes
  resources :vehicle_stops
  resources :vehicle_stop_times
  resources :vehicle_trips
  resources :vehicle_routes
  
  namespace :api do
    
    get 'auth/index'
    post 'auth/authenticate'
    
    resources :vehicle_realtimes
    resources :vehicle_stops
    resources :vehicle_stop_times
  
    get 'vehicle_trips/search', to: 'vehicle_trips#search'
    
    resources :vehicle_trips
    resources :vehicle_routes
    
    #mount_devise_token_auth_for 'User', at: 'auth'
  end
  
end
