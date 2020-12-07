require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @line_item = line_items(:one)
    @customer = customers(:one)
    sign_in @customer
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post game_line_items_url(@line_item.game.id), params: { line_item: { basket_id: @line_item.basket_id, game_id: @line_item.game_id } }
    end

    assert_redirected_to basket_url(LineItem.last)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete game_line_item_url(@line_item.game.id, @line_item)
    end

    assert_redirected_to game_line_items_url(@line_item.game.id)
  end
end
