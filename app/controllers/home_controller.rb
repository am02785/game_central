class HomeController < ApplicationController

  # The home action which gets the home page.
  # GET /
  def home
  end

  # The contact action which gets the contact page.
  # GET /contact
  def contact
  end

  # The request_contact action which submits the contact form.
  # POST /request_contact
  def request_contact
    name = params[:name] # The value of the name field.
    email = params[:email] # The value of the email field.
    telephone = params[:telephone] # The value of the telephone field.
    message = params[:message] # The value of the message field.

    if email.blank? # Checks whether an email address has been submitted.
      flash[:alert] = I18n.t('home.request_contact.no_email') # Shows an alert if the email field is empty.
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now # Sends an email.
      flash[:notice] = I18n.t('home.request_contact.email_sent') # Shows an notice if email has been sent successfully.
    end

    redirect_to root_path # Re-display the root path.
  end

end
