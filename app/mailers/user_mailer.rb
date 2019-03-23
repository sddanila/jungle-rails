class UserMailer < ApplicationMailer
  def confirm_order(email, order)
    @order = order
    mail(to: email, subject: 'Your order is confirmed. Order id: #{order}')
  end
end
