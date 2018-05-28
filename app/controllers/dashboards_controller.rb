class DashboardsController < ApplicationController
  before_action :authenticate_employee!

  def show
    @employee_carts = EmployeeCart.all
    @items = Item.all

    # @employee_cart = EmployeeCart.find(params[:id])
  end
end
