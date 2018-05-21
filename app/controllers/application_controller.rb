class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  include CurrentCart
  # make cart show everywhere
  before_action :set_cart

  # helper_method :current_order

  # def current_order
  #   if !session[:order_id].nil?
  #     Order.find(session[:order_id])
  #   else
  #     Order.new
  #   end
  # end

end
