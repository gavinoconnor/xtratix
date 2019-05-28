Rails.application.routes.draw do
  resources :tickets
  resources :venues
  resources :users

  # patch '/friend_list', to: 'friend_list#update'

end
