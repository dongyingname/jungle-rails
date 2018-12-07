class UserMailer < ApplicationMailer

  default from: 'notifications@example.com'
 
  def welcome_email
    # id = @order_id
   

    @url  = 'http://example.com/login'
    mail(to: 'dongyingname@yahoo.com', subject: 'Welcome to My Awesome Site')
  end

end
