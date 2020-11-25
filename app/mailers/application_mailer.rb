class ApplicationMailer < ActionMailer::Base
  # The default "to:" field and the default "from:" field is "info@gamecentral.com".
  default to: 'info@gamecentral.com', from: 'info@gamecentral.com'
  # Sets the layout to mailer.
  layout 'mailer'
end
