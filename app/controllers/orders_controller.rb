class OrdersController < ApplicationController
  # before_action :authenticate_employee!
  # before_action :authenticate_user!
  # before_action :set_order, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  def create
    @order = Order.new(order_params)

    # Once the order is save redirect to the orders #show page
    # on the order#show page, user will "pay" there.
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render cart_path }
        format.json { render json: @orders.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:subtotal, :tax, :total, :status)
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
