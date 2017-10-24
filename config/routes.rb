Rails.application.routes.draw do
  root "main#index"

  resources :trainers, only: [:show]
  resources :monsters, only: [:destroy]

  get '/auth/github/callback', to: 'sessions#create', as: :auth_callback_github
end
