class Notifier < ApplicationMailer
  default from: "no-reply@jungle.com"
  def confirm_order(order, line_items)
    mail(to: order.email, subject: "Your order is confirmed") do |format|
      format.html { render "mailer", line_items: line_items }
    end
  end
end
