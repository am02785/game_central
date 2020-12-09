require 'test_helper'

# tests the order model
class OrderTest < ActiveSupport::TestCase

  # called before every test
  setup do
    @customer = customers(:one) # sets a property to a customer in the database from our fixtures
  end

  # tests whether an empty order cannot be saved
  test 'should not save empty order' do
    order = Order.new # creates a new order

    order.save # attempts to save the order
    refute order.valid? # the order should not be saved
  end

  # tests whether a valid order can be saved
  test 'should save valid order' do
    order = Order.new # creates a new order
    order.customer = @customer # sets the customer of the order
    order.name_on_credit_card = "Bob Example" # sets the name_on_credit_card of the order
    order.CVV = "1111" # sets the CVV of the order
    order.credit_card_number = "1111 1111 1111 1111" # sets the credit_card_number of the order
    order.credit_card_valid_until = Date.today + 1 # sets the credit_card_valid_until of the order
    order.total_cost = 49.99 # sets the total_cost of the order

    order.save # attempts to save the order
    assert order.valid? # the order should be saved
  end

  # tests whether a order with an invalid name_on_credit_card cannot be saved
  test 'should not save order with invalid name_on_credit_card' do
    order = Order.new # creates a new order
    order.customer = @customer # sets the customer of the order
    order.name_on_credit_card = "Bob" # sets the name_on_credit_card of the order to an invalid value
    order.CVV = "1111" # sets the CVV of the order
    order.credit_card_number = "1111 1111 1111 1111" # sets the credit_card_number of the order
    order.credit_card_valid_until = Date.today + 1 # sets the credit_card_valid_until of the order
    order.total_cost = 49.99 # sets the total_cost of the order

    order.save # attempts to save the order
    refute order.valid? # the order should not be saved
  end

  # tests whether a order with an invalid CVV cannot be saved
  test 'should not save order with invalid CVV' do
    order = Order.new # creates a new order
    order.customer = @customer # sets the customer of the order
    order.name_on_credit_card = "Bob Example" # sets the name_on_credit_card of the order
    order.CVV = "11111" # sets the CVV of the order to an invalid value
    order.credit_card_number = "1111 1111 1111 1111" # sets the credit_card_number of the order
    order.credit_card_valid_until = Date.today + 1 # sets the credit_card_valid_until of the order
    order.total_cost = 49.99 # sets the total_cost of the order

    order.save # attempts to save the order
    refute order.valid? # the order should not be saved
  end

  # tests whether a order with an invalid credit_card_number cannot be saved
  test 'should not save order with invalid credit_card_number' do
    order = Order.new # creates a new order
    order.customer = @customer # sets the customer of the order
    order.name_on_credit_card = "Bob Example" # sets the name_on_credit_card of the order
    order.CVV = "1111" # sets the CVV of the order
    order.credit_card_number = "1111 1111 1111" # sets the credit_card_number of the order to an invalid value
    order.credit_card_valid_until = Date.today + 1 # sets the credit_card_valid_until of the order
    order.total_cost = 49.99 # sets the total_cost of the order

    order.save # attempts to save the order
    refute order.valid? # the order should not be saved
  end

  # tests whether a order with an invalid credit_card_valid_until cannot be saved
  test 'should not save order with invalid credit_card_valid_until' do
    order = Order.new # creates a new order
    order.customer = @customer # sets the customer of the order
    order.name_on_credit_card = "Bob Example" # sets the name_on_credit_card of the order
    order.CVV = "1111" # sets the CVV of the order
    order.credit_card_number = "1111 1111 1111 1111" # sets the credit_card_number of the order
    order.credit_card_valid_until = Date.today # sets the credit_card_valid_until of the order to an invalid value
    order.total_cost = 49.99 # sets the total_cost of the order

    order.save # attempts to save the order
    refute order.valid? # the order should not be saved
  end

  # tests whether a order with an invalid total_cost cannot be saved
  test 'should not save order with invalid total_cost' do
    order = Order.new # creates a new order
    order.customer = @customer # sets the customer of the order
    order.name_on_credit_card = "Bob Example" # sets the name_on_credit_card of the order
    order.CVV = "1111" # sets the CVV of the order
    order.credit_card_number = "1111 1111 1111 1111" # sets the credit_card_number of the order
    order.credit_card_valid_until = Date.today + 1 # sets the credit_card_valid_until of the order
    order.total_cost = 0 # sets the total_cost of the order to an invalid value

    order.save # attempts to save the order
    refute order.valid? # the order should not be saved
  end

end
