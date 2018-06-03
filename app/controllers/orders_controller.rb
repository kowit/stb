class OrdersController < ApplicationController
  include CurrentCart

  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order

  def index
    @orders = Order.order("created_at DESC")
  end

  def show
    # Find the current order by params id
    @order = Order.find(params[:id])

    # update the attribute with the current user's ID
    @pending_status = "pending"
    @order.update_attribs(current_user.id, 
                          @cart.total, 
                          @cart.total_with_tax, 
                          @cart.tax, @order_status)
  end

  def new
    @order = Order.new
  end

  def edit
    @orders = Order.order("created_at DESC")
    @order = Order.find(params[:id])

    if @order.status == "completed"
      @order.destroy
      respond_to do |format|
        format.html { redirect_to orders_path, notice: "Order was successfuly completed." }
        format.json { head :no_content }
      end
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:notice] = "Order Status Updated"
      # redirect_to edit_order_path
      redirect_to orders_path
      @order.destroy
    else
      render "edit"
    end
  end

  def create
    # Create the order
    @order = Order.new(order_params)

    @current_user = current_user
    @pending_status = "pending"

    # update the attribute with the current user's ID
    @order.update_attribs(current_user.id,
                          @cart.total,
                          @cart.total_with_tax,
                          @cart.tax)

    # TODO: update the cart's order_id attribute
    # order29.order_items.map { |order_item| order_item.cart.order_id }
    # order_35.order_items.map { |oi| oi.cart.order_id = order_35.id }
    @current_order_id = @order.id
    @order.update_cart_order_attribute(@current_order_id)

    # Once the order is save redirect to the orders #show page
    # on the order#show page, user will "pay" there.
    respond_to do |format|
      # If the order is saved successfully
      if @order.save
        # format.html { redirect_to @order, notice: "Order successfully created." }
        # format.json { render :show, status: :created, location: @order }
        format.html { redirect_to order_summary, notice: "Order successfully created." }
        format.json { render :order_summary, status: :created, location: order_summary }
      else
        format.html { render cart_path }
        format.json { render json: @orders.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @order.destroy if @order == session[:order_id]
    @order = Order.find(params[:id])

    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path, notice: "Order was successfuly done." }
      format.json { head :no_content }
    end

  end

  def employee_order
    @order = Order.find(params[:id])
  end

  def order_summary
    # Find the current order by params id
    @order = Order.find(params[:id])
    # update the attribute with the current user's ID
    @pending_status = "pending"
    @order.update_attribs(current_user.id, @cart.total, @cart.total_with_tax, @cart.tax)
  end

  private

  def order_params
    params.require(:order).permit(:name, :subtotal, :tax, :total, :status)
  end

  def invalid_order
    logger.error "Attempt to access invalid order #{params[:id]}"
    redirect_to root_path, notice: "That order doesn't exist"
  end
end
