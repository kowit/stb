class ChargesController < ApplicationController
  # Shows a credit card form (using Checkout).
  # Creates the actual charges by calling our API.
  before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :set_description

  def new
  end

  def create
    # Amount in cents
    # @current_cart = Cart.find_by_id(params[:id])
    # @current_cart = Cart.find(cart_params)
    # @amount = @current_cart.total_price
    @amount = 500

    # customer is the the current_user
    # customer = Stripe::Customer.create(
    #   :email => current_user.email,
    #   :source => params[:stripeToken]
    #   # :email => params[:stripeEmail],
    #   # :source  => params[:stripeToken]
    # )

    # customer = Stripe::Charge.create(
    #   :customer    => current_user.id,
    #   :amount      => @amount,
    #   :description => @description,
    #   :currency    => 'usd'
    # )

  customer = Stripe::Customer.create
  current_user.update_attributes :stripe_id => customer.id

    # customer = Stripe::Customer.create(
    #   :email => params[:stripeEmail],
    #   :source  => params[:stripeToken]
    # )

    # charge = Stripe::Charge.create(
    #   :customer    => customer.id,
    #   :amount      => @amount,
    #   :description => 'Rails Stripe customer',
    #   :currency    => 'usd'
    # )

    # redirect_to thanks_path

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
