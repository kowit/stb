class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :set_description

  def thanks
  end

  def new
  end

  def create
    # Amount in cents
    # @current_cart = Cart.find_by_id(params[:id])
    # @current_cart = Cart.find(cart_params)
    # @amount = @current_cart.total_price
    
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source => params[:stripeToken]
      # :email => params[:stripeEmail],
      # :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => current_user.id,
      :amount      => @cart.total_price,
      :description => @description,
      :currency    => 'usd'
    )

    redirect_to thanks_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def set_description
    # @description = Item.description
    @description = "Some amazing product"
  end

  def amount_to_be_charged
    @amount = 500
  end

end
