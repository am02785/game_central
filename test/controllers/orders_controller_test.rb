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

    assert_template layout: 'application'

    assert_select 'h1', 'Your Orders'
    assert_select 'table' do
      assert_select 'thead' do
        assert_select 'tr' do
          assert_select 'th', 'Order Number'
          assert_select 'th', 'Total Cost'
          assert_select 'th', 'Link To Order'
        end
      end
      assert_select 'tbody' do
        assert_select 'td', '1'
        assert_select 'td', '£' + @order.total_cost.to_s
        assert_select 'td' do
          assert_select 'a', 'Show Order'
        end
      end
    end
    assert_select 'br'
  end

  test "should get new" do
    get new_order_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'h1', 'Checkout'
    assert_select 'form#new_order' do
      assert_select 'div.field' do
        assert_select 'input#order_customer_id'
      end
      assert_select 'div.field' do
        assert_select 'label', 'Name On Card'
        assert_select 'input#order_name_on_credit_card'
      end
      assert_select 'div.field' do
        assert_select 'label', 'CVV'
        assert_select 'input#order_CVV'
      end
      assert_select 'div.field' do
        assert_select 'label', 'Card Number'
        assert_select 'input#order_credit_card_number'
      end
      assert_select 'div.field' do
        assert_select 'label', 'Valid Until'
        assert_select 'select#order_credit_card_valid_until_1i' do
          assert_select 'option'
        end
        assert_select 'select#order_credit_card_valid_until_2i' do
          assert_select 'option'
        end
        assert_select 'input#order_credit_card_valid_until_3i'
      end
      assert_select 'div.actions' do
        assert_select 'input'
      end
    end
    assert_select 'a', 'Back'
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { CVV: @order.CVV, credit_card_number: @order.credit_card_number, credit_card_valid_until: @order.credit_card_valid_until, customer_id: @order.customer_id, name_on_credit_card: @order.name_on_credit_card, total_cost: @order.total_cost } }
    end

    assert_redirected_to order_url(Order.last)

    assert_equal 'Order was successfully created.', flash[:notice]

    assert_equal @order.CVV, Order.last.CVV
    assert_equal @order.credit_card_number, Order.last.credit_card_number
    assert_equal @order.credit_card_valid_until, Order.last.credit_card_valid_until
    assert_equal @order.customer, Order.last.customer
    assert_equal @order.name_on_credit_card, Order.last.name_on_credit_card
    assert_equal @order.total_cost, Order.last.total_cost
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success

    assert_template layout: 'application'

    assert_select 'div' do
      assert_select 'image'
      assert_select 'p', @order.line_items.first.game.title
      assert_select 'p', 'Delivered'
    end
    assert_select 'h4', 'Total Cost: £' + @order.total_cost.to_s
    assert_select 'a', 'Back'
  end
end
