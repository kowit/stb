class ChargesController < ApplicationController
  include CurrentCart

  # Shows a credit card form (using Checkout).
  # Creates the actual charges by calling our API.
  before_action :authenticate_user!

  def new
    @cart = Cart.find(params[:id])
  end

  def create
    # Amount in cents
    @amount = 500

    # This will work!
    # customer = Stripe::Customer.create
    # current_user.update_attributes :stripe_id => customer.id

    # TODO: Have to get order from current_user
    customer = Stripe::Customer.create
    # charge = Stripe::Charge.create({
    #   amount: '',
    #   currency: 'usd',
    #   source: 'tok_visa',
    #   receipt_email: current_user.email
    # })
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

    # TODO: some how redirect to orders controller so 
    # we can create the order
    redirect_to cart_review_path(@cart)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end

end
