class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'
 
  def confirm_order(order)

    
    mail(to: 'dongyingname@yahoo.com', subject: 'Welcome to My Awesome Site')
  end

end
