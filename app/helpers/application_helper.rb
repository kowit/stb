module ApplicationHelper
  TAX = 0.07

  def employee_cart_count_over_one
    if @employee_cart.employee_line_items.count > 0
      return "#{@employee_cart.employee_line_items.count}".html_safe
    else
      return "0".html_safe
    end
  end

  def employee_cart_has_items
    return @employee_cart.employee_line_items.count >= 0
  end

  def cart_count_over_one
    if @cart.line_items.count > 0
      return "#{@cart.line_items.count}".html_safe
    else
      return "".html_safe
    end
  end

  def cart_is_empty
    if @cart.line_items.count == 0
      return "Cart is empty".html_safe
    end
  end
  # if cart has line_iems >= to 0
  # return the count of line_items
  def cart_has_items
    return @cart.line_items.count >= 0
  end

  def get_sales_tax
    TAX
  end

  def print_item_names(order)
    order.order_items.each do |order_item|
      order_item.cart.line_items.each do |line_item|
        return "<li><strong>#{line_item.name}</strong></li>".html_safe
      end
    end
  end

  # def total_price_after_sales_tax
  #   # subtotal = @cart.total_price * (@order.tax_amount)
  #   subtotal = @cart.total_price * (7.0 / 100.0)
  #   total_price = @cart.total_price + subtotal
  #   total_price
  # end

  # def sales_tax_florida
  #   TAX
  # end
end
