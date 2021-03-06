Rails.application.routes.draw do
  resources :tickets
  resources :venues
  resources :users
  resources :friendships
  resources :sessions

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
