Rails.application.routes.draw do
  # Administrate
  namespace :admin do
    resources :orders
    resources :items
    resources :employees
    resources :users

    resources :carts
    resources :employee_carts
    resources :employee_line_items
    resources :line_items

    resources :order_items

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

  get "/orders/:id" => "orders#order_summary"
  get "/order_dashboard" => "orders#order_dashboard"

  root to: "items#index"

  # get "pages" => "pages#show", via: [:get]

  resource :dashboard, only: [:show]

  resources :line_items
  resources :items
  resources :carts
  resources :cart_reviews, only: [:show]
  resources :order_items
  resources :orders

  resources :employee_line_items
  resources :employee_carts
  resources :charges
end
