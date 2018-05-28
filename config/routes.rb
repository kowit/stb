Rails.application.routes.draw do
  # Master route for employees/admin
  get "/stb" => "welcomes#show"

  # Devise route for Employees
  devise_for :employees, path: 'employees', controllers: {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations'
  }

  # Routes for /employees
  # create employee_root_path
  # get "/employees" => "employees#index", as: :employee_root 
  get "/stb" => "welcomes#show", as: :employee_root 
	namespace :employee do
		root 'employees#show' # creates user_root_path
	end

  # Routes for ActiveAdmin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "/admins" => "admin/dashboard#index"

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

  root to: "items#index"

  resource :dashboard, only: [:show]

  resources :line_items
  resources :items
  # resources :carts do
  #   resources :orders
  # end
  resources :carts
  resources :cart_reviews, only: [:show]
  resources :order_items
  resources :orders

  resources :employee_line_items
  resources :employee_carts
  resources :charges

  # root to: "items#index"

  # namespace for administrate
  # namespace :admin do
  #   # resources for administrate
  #   resources :users
  #   resources :items
  #   resources :orders

  #   root to: "users#index"
  # end

end
