Rails.application.routes.draw do
  
  resources :users_favorite_routes
  resources :vehicle_stop_times, only: [:index, :show, :edit, :update, :destroy]
  get 'vehicle_realtimes/pull', to: 'vehicle_realtimes#pull'
  
  resources :vehicle_realtimes, only: [:index, :show, :edit, :update, :destroy]
  resources :vehicle_stops, only: [:index, :show, :edit, :update, :destroy]
  resources :vehicle_stop_times, only: [:index, :show, :edit, :update, :destroy]
  resources :vehicle_trips, only: [:index, :show, :edit, :update, :destroy]
  resources :vehicle_routes, only: [:index, :show, :edit, :update, :destroy]
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  
  namespace :api do
    resources :vehicle_realtimes, only: [:index, :show, :edit, :update, :destroy]
    resources :vehicle_stops, only: [:index, :show, :edit, :update, :destroy]
    resources :vehicle_stop_times, only: [:index, :show, :edit, :update, :destroy]
  
    get 'vehicle_trips/search', to: 'vehicle_trips#search'
    
    resources :vehicle_trips, only: [:index, :show, :edit, :update, :destroy]
    resources :vehicle_routes, only: [:index, :show, :edit, :update, :destroy]
    
    get 'auth/authenticate'
    post 'auth/authenticate'
    get 'user', to: 'users#index'
    
    get 'user/favorite_routes', to: 'users_favorite_routes#index'
    post 'user/favorite_routes', to: 'users_favorite_routes#create'
    
  end

  root "home#index"
end
