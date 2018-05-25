class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # before_action :authenticate_with_token!
  # respond_to :json

  def index
  end

  # Show action is probably only relevant!
  def show
    # @cart = Cart.find_by_id(session[:id])
    # respond_with current_user.orders.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    # order = current_user.orders.build(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:subtotal, :tax, :total, :user_id, :line_items => [])
    # params.require(:order).permit(:total, :user_id, :product_ids => [])
  end

  def set_order
    @order = Order.find(params[:id])
    # @cart = Card.find(params[:id])
  end

  # def cart_params
  #   params.fetch(:cart, {})
  # end

  # def order_params
  #     params.require(:order).permit(:product_ids => [])
  # end
end
