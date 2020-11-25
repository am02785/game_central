# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
# Previews for the contact mailer.
class ContactMailerPreview < ActionMailer::Preview

  # A preview for the contact mailer.
  def contact_email
    ContactMailer.contact_email('matthew@me.com',
                                'Matthew Casey', '1234567890', @message = 'Hello') # Sends an email.
  end

end
