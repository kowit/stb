class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    # @amount = 500
    @current_cart = Cart.find_by_id(params[:id])
    # @current_cart = Cart.find(cart_params)
    @amount = @current_cart.total_price
    
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source => params[:stripeToken]
      # :email => params[:stripeEmail],
      # :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
  
  def cart_params
    params.fetch(:cart, {})
  end
end
