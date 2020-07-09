Rails.application.routes.draw do
  root 'sessions#login'
  resources :items, except: [:show]
  resources :orders, only: [:index, :show, :create]
  resources :restaurants, only: [:show, :index]
  resources :users
  get '/sessions/new', to: 'sessions#login', as: 'new_login'

  #  user login action
  post '/sessions/user', to: 'sessions#create_user', as: 'create_user'
  
  #  restaurant login action
  post '/sessions/restaurant', to: 'sessions#create_restaurant', as: 'create_restaurant'

  #  logout
  delete '/sessions/logout', to: 'sessions#logout', as: 'sessions_logout'

  #  change order status

  patch 'orders/:id/change_status', to: 'orders#change_status', as: 'change_order_status'
end
