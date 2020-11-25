# The contact mailer used to send an email.
class ContactMailer < ApplicationMailer

  # The method which used to send an email.
  def contact_email(email, name, telephone, message)
    @email = email # Sets the email attribute to the email parameter.
    @name = name # Sets the name attribute to the name parameter.
    @telephone = telephone # Sets the telephone attribute to the telephone parameter.
    @message = message # Sets the message attribute to the message parameter.

    mail cc: @email # Sets the "cc:" field to the email attribute.
  end

end
