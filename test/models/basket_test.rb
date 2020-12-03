require 'test_helper'

# tests the basket model.
class BasketTest < ActiveSupport::TestCase

  # tests whether an empty basket cannot be saved
  test 'should not save empty basket' do
    basket = Basket.new # creates a new basket

    basket.save # attempts to save the basket
    refute basket.valid? # the basket should not be saved
  end

  # tests whether a valid basket can be saved
  test 'should save valid basket' do
    basket = Basket.new # creates a new basket

    basket.total_cost = 49.99 # sets the total_cost of the basket

    basket.save # attempts to save the basket
    assert basket.valid? # the basket should be saved
  end

  # tests whether a basket with an invalid total_cost cannot be saved
  test 'should not save basket with invalid total_cost' do
    basket = Basket.new # creates a new basket

    basket.total_cost = -49.99 # sets the total_cost of the basket to an invalid value

    basket.save # attempts to save the basket
    refute basket.valid? # the basket should not be saved
  end

end
