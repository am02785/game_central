require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @basket = baskets(:one)
    @customer = customers(:one)
    sign_in @customer
  end

  test "should create basket" do
    assert_difference('Basket.count') do
      post baskets_url, params: { basket: { total_cost: @basket.total_cost, customer_id: @customer.id } }
    end

    assert_redirected_to basket_url(Basket.last)

    assert_equal 'Basket was successfully created.', flash[:notice]

    assert_equal @customer, Basket.last.customer
    assert_equal 0, Basket.last.total_cost
  end

  test "should show basket" do
    get basket_url(@basket)
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Game Central'
    assert_select 'h1', 'Shopping Basket'
    assert_select 'div#line_item_' + @basket.line_items.first.id.to_s do
      assert_select 'image'
      assert_select 'p', @basket.line_items.first.game.title
      assert_select 'a#remove_from_basket_link', 'Remove From Basket'
      assert_select 'br'
    end
    assert_select 'h4#total_cost_of_basket', 'Total Cost: £' + @basket.total_cost.to_s
    assert_select 'a#proceed_to_checkout_link', 'Proceed To Checkout'
  end

  test "should destroy basket" do
    assert_difference('Basket.count', -1) do
      delete basket_url(@basket)
    end
  end
end
