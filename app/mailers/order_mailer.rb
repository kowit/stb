class OrderMailer < ApplicationMailer
  #default from: 'no-reply@example.com',
  #  return_path: 'system@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.receipt.subject
  #
  def send_receipt(current_user_email)
    @greeting = "Hi"
    # order.order_items.map { |order_item| order_item.carts.map { |line_item| line_item.name }}
    # order.subtotal
    # order.tax
    # order.total
    @email = current_user_email

    mail(to: @email, subject: "Test Receipt.")
  end
end
