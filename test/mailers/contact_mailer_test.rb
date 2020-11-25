require 'test_helper'

# tests the contact mailer.
class ContactMailerTest < ActionMailer::TestCase

  # tests whether the contact email is returned.
  test 'should return contact email' do
    mail = ContactMailer.contact_email('matthew@me.com',
                                       'Matthew Casey', '1234567890', @message = 'Hello') # Sends email.
    assert_equal ['info@gamecentral.com'], mail.to # tests whether the to field is info@gamecentral.com.
    assert_equal ['info@gamecentral.com'], mail.from # tests whether the from field is info@gamecentral.com.
  end

end
