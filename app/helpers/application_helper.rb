module ApplicationHelper

  def cart_count_over_one
    if @cart.line_items.count > 0
      return "#{@cart.line_items.count}".html_safe
      #return "<span class='tag is-dark is-large'>#{@cart.line_items.count}</span>".html_safe
    end
  end

  # if cart has line_iems >= to 0
  # return the count of line_items
  def cart_has_items
    return @cart.line_items.count >= 0
  end

  def total_price_after_sales_tax
    subtotal = @cart.total_price * (@order.tax_amount)
    total_price = @cart.total_price + subtotal
    total_price
  end
end
