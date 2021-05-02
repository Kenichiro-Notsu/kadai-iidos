Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'history', to: 'operations#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:create]

  resources :nodes
  resources :operations, only: [:index]
end