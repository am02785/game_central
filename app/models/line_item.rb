# The line item model which represents a line item which the customer adds to the basket
class LineItem < ApplicationRecord
  # The game which the line item belongs to cannot be null.
  validates :game_id, presence: true
  # The basket which the line item belongs to cannot be null.
  validates :basket_id, presence: true
  # Each line item belongs to a game.
  belongs_to :game
  # Each line item belongs to a basket.
  belongs_to :basket
end
