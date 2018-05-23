Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: { registrations: "registrations" }

  get "connect_to_items_path", to: "items#index"

  root to: "items#index"
  # root to: "welcomes#show", via: :get

  get 'thanks', to: 'charges#thanks', as: 'thanks'

  namespace :admin do
    resources :users
    resources :items

    root to: "users#index"
  end

  resource :dashboard, only: [:show]

  resources :line_items

  resources :carts do
    resources :orders, only: [:new]
  end

  resources :items

  resources :charges
end
