require 'test_helper'

# tests the home controller.
class HomeControllerTest < ActionDispatch::IntegrationTest
  # includes devise in the controller tests.
  include Devise::Test::IntegrationHelpers

  # tests the home action.
  test 'should get home' do
    get root_url
    assert_response :success # tests whether we can perform a get on home.

    assert_template layout: 'application'

    assert_select 'title', 'Game Central'
    assert_select 'p', 'Welcome to the game central store.' # tests the content of the p element.
    assert_select 'input#color'
    assert_select 'button#color_button', 'change color'
    assert_select 'br'
    assert_select 'label', 'font size:'
    assert_select 'select#font_size' do
      assert_select 'option', 'small'
      assert_select 'option', 'medium'
      assert_select 'option', 'large'
    end
    assert_select 'br'
    assert_select 'button#font_size_button', 'change font size'
  end

  # tests the contact action.
  test 'should get contact' do
    get contact_url
    assert_response :success # tests whether we can perform a get on contact.

    assert_template layout: 'application' # tests whether the contact page has the same layout as the application.

    assert_select 'title', 'Game Central' # tests the title of the contact page.
    assert_select 'h1', 'Contact Us' # tests the content of the h1 element.
    assert_select 'p', 'Complete the following form to get in touch with us.' # tests the content of the p element.
  end


  # tests the request_contact action.
  # tests failure when an email address has not been submitted.
  test 'should post request contact but no email' do
    post request_contact_url # performs a post request which does not have any parameters.

    assert_redirected_to root_url # tests whether the user is redirected.
    assert_equal 'You must supply an email address', flash[:alert] # tests whether the alert flash message is not empty.
    assert_nil flash[:notice] # tests whether the notice flash message is empty.
  end

  # tests the request_contact action.
  # tests success when an email address has been submitted.
  test 'should post request contact' do
    post request_contact_url, params:
        {name: 'Matthew', email: 'matthew@me.com',
         telephone: '1234567890', message: 'Hello'} # performs a post request which has parameters including an email.

    assert_redirected_to root_url # tests whether the user is redirected.
    assert_nil flash[:alert] # tests whether the alert flash message is empty.
    assert_equal 'Thank you. We will be in touch shortly.', flash[:notice] # tests whether the notice flash message is not empty.
  end

end
