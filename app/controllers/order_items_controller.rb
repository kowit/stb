class OrderItemsController < ApplicationController
  # include the current based on session id
  include CurrentOrder
  before_action :authenticate_user!
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:create]
  # before_action :set_cart, only: [:create]
  # before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
  end
  
  def create
    # Find the cart id that is going to be added into the order_item
    @cart = Cart.find(params[:cart_id])

    # create a new order item with the order and cart
    @order_item = @order.add_cart(@cart)

    respond_to do |format|
      # if we successfully save the cart to the order item, redirect to the orders#new path
      # so the user can enter a name for the order
      if @order_item.save
        # format.html { redirect_to @order, notice: "Order successfully created." }
        format.html { redirect_to @order_item.order, notice: "Order successfully created." }
        # format.html { redirect_to new_order_path, notice: "Order successfully created." }
        format.json { render :show, status: :created, location: @order_item}
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  # def set_cart
  #   @cart = Cart.find(params[:cart_id])
  # end
  
  def set_order_item
    params.require(:order_item).permit(:cart_id, :order_id)
  end
end
