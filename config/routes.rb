Rails.application.routes.draw do
  devise_for :users

  root to: "welcomes#show", via: :get

  resources :items, only: [:index]
end
