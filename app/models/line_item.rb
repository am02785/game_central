# The line item model which represents a line item which the customer adds to the basket
class LineItem < ApplicationRecord
  # The game which the line item belongs to cannot be null.
  validates :game_id, presence: true
  # Each line item belongs to a game.
  belongs_to :game
  # Each line item can belong to a basket.
  belongs_to :basket

  # if a line_item has an order, it should also have a delivery_date
  validate :should_not_have_delivery_date_without_order

  # if a line_item has an order, it should also have a delivery_date
  def should_not_have_delivery_date_without_order
    if :order_id != nil && :delivery_date == nil
      errors.add(:delivery_date, 'must be included if order is included')
    end
  end

end
