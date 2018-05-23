Rails.application.routes.draw do
  devise_for :users
  
  namespace :users, only: [:show, :create, :update, :destroy] do
    # resources :carts, only: [:create, :update, :destroy]
    resources :orders, only: [:index, :show, :new]
  end
  # devise_for :users, controllers: { registrations: "registrations" }

  get "connect_to_items_path", to: "items#index"

  root to: "items#index"
  # root to: "welcomes#show", via: :get

  get 'thanks', to: 'charges#thanks', as: 'thanks'

  namespace :admin do
    resources :users
    resources :items
    resources :orders

    root to: "users#index"
  end

  resource :dashboard, only: [:show]

  resources :line_items
  resources :items
  resources :carts do
    resources :orders, only: [:new]
  end

  resources :charges

end
