class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_with_token!
  # respond_to :json

  def index
  end

  def show
    # respond_with current_user.orders.find(params[:id])
  end

  def new
  end

  def create
    order = current_user.orders.build(order_params)

    if order.save
      render json: order, status: 201, location: [:api, current_user, order]
    else
      render json: { errors: order.errors }, status: 422
    end
  end

  private

  def order_params
    params.require(:order).permit(:total, :user_id, :line_items => [])
    # params.require(:order).permit(:total, :user_id, :product_ids => [])
  end

  # def order_params
  #     params.require(:order).permit(:product_ids => [])
  # end
end
