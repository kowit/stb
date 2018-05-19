Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :items

    root to: "users#index"
  end

  devise_for :users

  root to: "welcomes#show", via: :get

  resource :dashboard, only: [:show]

  resources :items
end
