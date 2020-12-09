require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @order = orders(:one)
    @customer = customers(:one)
    sign_in @customer
    @customer.basket = baskets(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { CVV: @order.CVV, credit_card_number: @order.credit_card_number, credit_card_valid_until: @order.credit_card_valid_until, customer_id: @order.customer_id, name_on_credit_card: @order.name_on_credit_card, total_cost: @order.total_cost } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end
end
