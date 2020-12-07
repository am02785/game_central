require 'test_helper'

# tests the customer model
class CustomerTest < ActiveSupport::TestCase

  # tests whether an empty customer cannot be saved
  test 'should not save invalid user' do
    customer = Customer.new # creates a new customer
    customer.save # attempts to save the customer
    refute customer.valid? # the customer should not be saved
  end

  # tests whether a valid customer can be saved
  test 'should save valid user' do
    customer = Customer.new # creates a new customer
    customer.email = 'bob@example.com' # sets the email of the customer
    customer.password = '12345678' # sets the password of the customer
    customer.save # attempts to save the customer
    assert customer.valid? # the customer should be saved
  end

end
