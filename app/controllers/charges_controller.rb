class ChargesController < ApplicationController
  # Shows a credit card form (using Checkout).
  # Creates the actual charges by calling our API.
  before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :set_description

  def new
    @user = current_user
    @current_user_email = current_user.email
  end

  def create
    # Amount in cents
    # @current_cart = Cart.find_by_id(params[:id])
    # @current_cart = Cart.find(cart_params)
    # @amount = @current_cart.total_price
    @amount = 500

    # This will work!
  # customer = Stripe::Customer.create
  # current_user.update_attributes :stripe_id => customer.id

  # TODO: Have to get order from current_user
  customer = Stripe::Customer.create
  charge = Stripe::Charge.create({
    amount: current_user.orders.total,
    currency: 'usd',
    source: 'tok_visa',
    receipt_email: current_user.email
  })
  current_user.update_attributes :stripe_id => customer.id

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  ) 

  # charge = Stripe::Charge.create(
  #   :customer    => customer.id,
  #   :amount      => @amount,
  #   :description => 'Rails Stripe customer',
  #   :currency    => 'usd'
  # )

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
