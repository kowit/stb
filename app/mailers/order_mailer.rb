class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.receipt.subject
  #
  def receipt(user)
    @greeting = "Hi"
    # order.order_items.map { |order_item| order_item.carts.map { |line_item| line_item.name }}
    # order.subtotal
    # order.tax
    # order.total
    @user = user

    # mail to: current_user_email
    mail to: user.email, subject: "Test Receipt."
  end
end
