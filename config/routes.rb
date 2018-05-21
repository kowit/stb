Rails.application.routes.draw do
  devise_for :users

  root to: "welcomes#show", via: :get

  namespace :admin do
    resources :users
    resources :items

    root to: "users#index"
  end

  resource :dashboard, only: [:show]

  resources :line_items
  resources :carts
  resources :items
end
