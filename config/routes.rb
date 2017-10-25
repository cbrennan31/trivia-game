Rails.application.routes.draw do

  root 'home#index'
  get 'auth/google/callback',  to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :home, only: [:index]
  resources :game, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:update]
      resources :clues, only: [:index]
      resources :games, only: [:create]
    end
  end
end
