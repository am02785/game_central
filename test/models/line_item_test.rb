require 'test_helper'

# tests the line item model
class LineItemTest < ActiveSupport::TestCase

  # called before every test
  setup do
    @game = games(:one) # sets a property to a game in the database from our fixtures
    @basket = baskets(:one) # sets a property to a basket in the database from our fixtures
    @order = orders(:one) # sets a property to a basket in the database from our fixtures
  end

  # tests whether an empty line item cannot be saved
  test 'should not save empty line_item' do
    line_item = LineItem.new # creates a new line item

    line_item.save  # attempts to save the line item
    refute line_item.valid? # the line item should not be saved
  end

  # tests whether a valid line item with a basket can be saved
  test 'should save valid line_item with a basket' do
    line_item = LineItem.new # creates a new line item

    line_item.game = @game # sets the game of the line item
    line_item.basket = @basket # sets the basket of the line item

    line_item.save # attempts to save the line item
    assert line_item.valid? # the line item should be saved
  end

  test 'should save valid line_item with a basket and order' do
    line_item = LineItem.new

    line_item.game = @game
    line_item.basket = @basket
    line_item.order_id = @order.id
    line_item.delivery_date = Date.today

    line_item.save
    assert line_item.valid?
  end

end
