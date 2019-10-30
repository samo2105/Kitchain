class UserNotifierMailer < ApplicationMailer
  default :from => 'no-reply@thekitchain.com'

  def send_signup_email(object)
    @object = object
    mail( :to => @object.email,
          :subject => 'Gracias por suscribirte a Kitchain' )
  end
end
