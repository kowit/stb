module CurrentOrder

  private

  # create a new order everytime
  def set_order
    @order = Order.create
    session[:order_id] = @order.id
  end
end
