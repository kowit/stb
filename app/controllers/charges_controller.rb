class ChargesController < ApplicationController
  # include the current cart and order
  include CurrentCart
  include CurrentOrder

  # Shows a credit card form (using Checkout).
  # Creates the actual charges by calling our API.
  before_action :authenticate_user!
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:create]

  def new
    @cart = Cart.find(params[:id])
  end

  def create
    # Amount in cents
    # @amount = 500

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

    # TODO: some how redirect to orders controller so 
    # we can create the order
    # @order_item = OrderItem.create

    # Find the cart id that is going to be added into the order_item
    @cart = Cart.find(params[:cart_id])

    # create a new order item with the order and cart
    @order_item = @order.add_cart(@cart)
    @current_user_email = current_user.email

    respond_to do |format|
      # if we successfully save the cart to the order item, redirect to the orders#new path
      # so the user can enter a name for the order
      if @order_item.save
        receipt_email = OrderMailer.send_receipt(@current_user_email)
        receipt_email.deliver_now

        # format.html { redirect_to @order, notice: "Order successfully created." }
        # format.html { redirect_to new_order_path, notice: "Order successfully created." }
        format.html { redirect_to @order_item.order, notice: "Thank you, your order is successfully created." }
        format.json { render :show, status: :created, location: @order_item}
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end
end
