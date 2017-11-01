Rails.application.routes.draw do
  root "main#index"

  resources :trainers, only: [:show]
  resources :monsters, only: [:destroy]

  get '/auth/github/callback', to: 'sessions#create', as: :auth_callback_github

  get '/logos/search', to: 'logos#search', as: :logo_search
  get '/logos/:company_name', to: 'logos#show', as: :logo
end
