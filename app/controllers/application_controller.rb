class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  include CurrentCart

  # make cart show everywhere
  before_action :set_cart

  # after user signs in, redirect them
  def after_sign_in_path(resource)
    items_path
  end

  # helper_method :current_order

  # def current_order
  #   if !session[:order_id].nil?
  #     Order.find(session[:order_id])
  #   else
  #     Order.new
  #   end
  # end

end
