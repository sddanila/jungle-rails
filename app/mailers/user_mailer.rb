class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirm_order(email, order)
    @order = order
    @email = email
    mail(to: email, subject: "Your order is confirmed. Order id: #{order.id}")
  end
end
