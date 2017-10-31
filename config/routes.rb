Rails.application.routes.draw do

  root 'home#index'
  get 'auth/google/callback',  to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/privacy', to: 'home#privacy'

  resources :home, only: [:index]
  resources :game, only: [:index]
  resources :user_games, only: [:new, :index]

  namespace :api do
    namespace :v1 do
      resources :user_games, only: [:create, :index]
      resources :games, only: [:create]
      resources :clues, only: [:index]
    end
  end
end