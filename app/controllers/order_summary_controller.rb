class OrderSummaryController < ApplicationController
  include CurrentCart

  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order

  before_action :authenticate_user!

  def show
    # Find the current order by params id
    @order = Order.find(params[:id])
    # update the attribute with the current user's ID
    @pending_status = "pending"
    @order.update_attribs(current_user.id, @cart.total, @cart.total_with_tax, @cart.tax)
    set_new_cart
  end

  def set_new_cart
    # Make a new cart so the previous cart does not
    # tamper with the state of the Order.
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
