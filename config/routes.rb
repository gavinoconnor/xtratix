Rails.application.routes.draw do
  resources :tickets
  resources :venues
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  post '/venues,', to: 'venues#search', as: 'search'
end
