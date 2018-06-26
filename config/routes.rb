Rails.application.routes.draw do
  root to: "landings#show"

  # Administrate
  namespace :admin do
    resources :items
    resources :orders, only: [:index, :destroy]
    resources :users, only: [:show, :index, :destroy]
    resources :employees, only: [:show, :index, :destroy]

    root to: "employees#index"
  end

  # Master route for employees/admin
  get "/employees" => "welcomes#show"

  # Devise route for Employees
  devise_for :employees, path: 'employees', controllers: {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations'
  }

  # Routes for /employees
  # create employee_root_path
  # get "/employees" => "employees#index", as: :employee_root
  get "/employees" => "welcomes#show", as: :employee_root

  namespace :employees do
    root 'employees#show' # creates user_root_path
  end

  # Routes for ActiveAdmin
  # devise_for :admin_users, ActiveAdmin::Devise.config

  # get "/admins" => "admin/dashboard#index"

  # Devise routes for Users
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "/users" => "items#index", as: :user_root # create user_root_path
  namespace :user do
    root "items#index"
  end

  namespace :users, only: [:show, :create, :update, :destroy] do
    resources :orders, only: [:index, :show, :new]
    # resources :carts, only: [:create, :update, :destroy]
  end

  # get '/orders', to: 'orders#employee_order', as: 'employee_order'
  # get "/orders/:id" => "orders#order_summary"
  # get "cart_reviews/:id" => "charges#new"
  get "/orders/:id" => "order_summary#show", only: [:show]
  get "/order_dashboard" => "orders#order_dashboard"

  # We do not want people to access these routesc
  get "/line_items" => "items#index"
  get "/carts" => "items#index"

  # resource :dashboard, only: [:show]
  resource :landing, only: [:show]
  resources :line_items
  resources :items
  resources :carts
  resources :cart_reviews, only: [:show]
  resources :order_items
  resources :orders
  resources :employee_line_items
  resources :employee_carts
  resources :charges

  # redirect all unknown pathes to root path
  match '*path', to: redirect('/'), via: :all
end
