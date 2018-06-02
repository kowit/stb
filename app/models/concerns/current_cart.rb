module CurrentCart
  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id

    if @cart.order_id.is_a?(Integer)
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
