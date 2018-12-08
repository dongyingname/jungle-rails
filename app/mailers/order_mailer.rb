class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'
 
  def confirm_order(order)
    @email = order.email
    @sub_total_cents = order.total_cents
    @order_id = order.id
    
    mail(to: @email, subject: "Order Receipt from Jungle Website: Order ##{@order_id}")
  end

end
