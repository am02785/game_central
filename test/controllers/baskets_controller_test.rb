require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @basket = baskets(:one)
  end

  test "should create basket" do
    assert_difference('Basket.count') do
      post baskets_url, params: { basket: { total_cost: @basket.total_cost } }
    end

    assert_redirected_to basket_url(Basket.last)
  end

  test "should show basket" do
    get basket_url(@basket)
    assert_response :success
  end

  test "should destroy basket" do
    assert_difference('Basket.count', -1) do
      delete basket_url(@basket)
    end

    assert_redirected_to baskets_url
  end
end