class Mailer < ActionMailer::Base
 default from: 'contact_us@sjal.com'
 def contact_info(name,email,number,message)
   @name=name
   @email=email
   @number=number
   @message=message
    mail(to:'kajender.aero@gmail.com' , bcc: 'manivij94@gmail.com', subject:'Contact request from #{cookies[:email]}')
  end

end
