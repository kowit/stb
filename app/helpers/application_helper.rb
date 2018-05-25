module ApplicationHelper

  def cart_count_over_one
    if @cart.line_items.count > 0
      return "#{@cart.line_items.count}".html_safe
    else
      return "0".html_safe
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

  def total_price_after_sales_tax
    # subtotal = @cart.total_price * (@order.tax_amount)
    subtotal = @cart.total_price * (7.0 / 100.0)
    total_price = @cart.total_price + subtotal
    total_price
  end
end
