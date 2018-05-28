module CurrentEmployeeCart

  private

  def set_employee_cart
    @employee_cart = EmployeeCart.find(session[:employee_cart_id])
  rescue ActiveRecord::RecordNotFound
    @employee_cart = EmployeeCart.create
    session[:employee_cart_id] = @employee_cart.id
  end
end
