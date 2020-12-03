# The basket model which represents the basket which the customers put the games into.
class Basket < ApplicationRecord
  # The total cost of the games in the basket must not be null.
  validates :total_cost, presence: true
  # The total cost of the games in the basket must be greater than 0.
  validates :total_cost, numericality: { greater_than_or_equal_to: 0 }

  # A basket can contain 0 or more line items.
  # The line items in the basket should be destroyed if the basket is destroyed.
  has_many :line_items, dependent: :destroy
end
