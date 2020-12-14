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
      post game_line_items_url(@line_item.game.id), params: { line_item: { game_id: @line_item.game_id } }
    end

    assert_redirected_to basket_url(LineItem.last)

    assert_equal 'Line item was successfully created.', flash[:notice]

    assert_equal @line_item.basket.id + 1, LineItem.last.basket.id
    assert_equal @line_item.game_id, LineItem.last.game_id
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete game_line_item_url(@line_item.game.id, @line_item), xhr: true
    end
  end
end
