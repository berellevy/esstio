Rails.application.routes.draw do
  root 'sessions#login'
  resources :items, only: [:show]
  # resources :order_items
  resources :orders, only: [:index, :show, :create]
  resources :restaurants, only: [:show, :index]
  resources :users
  get '/sessions/new', to: 'sessions#login', as: 'new_login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/logout', to: 'sessions#logout', as: 'sessions_logout'
end
