class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order

  # include CurrentOrder
  # before_action :set_order, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_employee!
  # before_action :authenticate_user!
  # before_action :authenticate_with_token!

  def index
    @orders = Order.all
  end

  def show
    # Find the current order by params id
    @order = Order.find(params[:id])

    # update the attribute with the current user's ID
    @order.update_attribs(current_user.id,
                          @cart.total,
                          @cart.total_with_tax,
                          @cart.tax)
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    # Create the order
    @order = Order.new(order_params)

    # update the attribute with the current user's ID
    @order.update_attribs(current_user.id,
                          @cart.total,
                          @cart.total_with_tax,
                          @cart.tax)

    @current_user = current_user

    # Once the order is save redirect to the orders #show page
    # on the order#show page, user will "pay" there.
    respond_to do |format|
      # send email here
      # OrderMailer.receipt(@order, @current_user_email).deliver_now
      OrderMailer.receipt(@current_user).deliver
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
    params.require(:order).permit(:name, :subtotal, :tax, :total, :status)
  end

  def invalid_order
    logger.error "Attempt to access invalid order #{params[:id]}"
    redirect_to root_path, notice: "That order doesn't exist"
  end

  # def set_order
  #   @order = Order.find(params[:id])
  # end

  # def cart_params
  #   params.fetch(:cart, {})
  # end

  # def order_params
  #     params.require(:order).permit(:product_ids => [])
  # end
end
