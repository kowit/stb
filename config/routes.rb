Rails.application.routes.draw do
  devise_for :users

  root to: "welcomes#show", via: :get

  resource :dashboard, only: [:show]

  resources :items, only: [:index, :show]
end
