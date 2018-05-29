class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  include CurrentCart
  # include CurrentOrder

  # make cart show everywhere
  before_action :set_cart
  # before_action :set_order

  private

  # Overwriting the sign_out redirect path method
  # based on user
  # def after_sign_out_path_for(resource_or_scope)
  #   if resource_or_scope == :employee
  #     employee_root_path
  #   elsif resource_or_scope == :user
  #     root_path
  #   elsif resource_or_scope == :admin
  #     admin_root_path
  #   end
  # end

  # after user signs in, redirect them
  # def after_sign_in_path(resource)
  #   employee_url(resource)
  # end

  # def after_sign_in_path_for(user)
  #   user_url(user)
  # end

  # helper_method :current_order

  # def current_order
  #   if !session[:order_id].nil?
  #     Order.find(session[:order_id])
  #   else
  #     Order.new
  #   end
  # end

  # before_action :protect

  # private

  # def protect
  #   addresses = ['127.0.0.1', ...]
  #   if addresses.include?(request.remote_ip)
  #     # give access
  #   else
  #     # restrict access
  #   end
  # end

end
