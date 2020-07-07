Rails.application.routes.draw do
  resources :items
  resources :order_items
  resources :orders
  resources :restaurants
  resources :users
  get '/sessions/new', to: 'sessions#login', as: 'new_login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/logout', to: 'sessions#logout', as: 'sessions_logout'
end
