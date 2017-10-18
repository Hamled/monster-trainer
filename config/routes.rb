Rails.application.routes.draw do
  root "main#index"

  resources :trainers, only: [:show]
end
