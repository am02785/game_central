# The Order model which represents an order made by the customer
class Order < ApplicationRecord
  # the customer_id, name_on_credit_card, CVV, credit_card_number,
  # credit_card_valid_until, delivery_date and total_cost must not be null.
  validates_presence_of :customer_id, :name_on_credit_card, :CVV, :credit_card_number,
                        :credit_card_valid_until, :total_cost
  # the name_on_credit_card contain a forename and a surname,
  # both the forename and surname should start with a capital letter
  # and have lower case letters after the capital letter.
  validates :name_on_credit_card, format: { with: /\A[A-Z][a-z]+\s[A-Z][a-z]+\Z/,
                                            message: 'must have a valid forename and surname' }
  # the CVV must have 3 or 4 digits.
  validates :CVV, format: { with: /\A[0-9]{3,4}\Z/,
                            message: 'must have 3 or 4 digits' }
  # the credit_card_number must have 16 digits with spaces between every 4 digits.
  validates :credit_card_number, format: { with: /\A([0-9]{4}\s){3}[0-9]{4}\Z/,
                                           message: 'must have 16 digits with spaces between every 4 digits' }
  # credit_card_valid_until must be after the current day.
  validate :credit_card_valid_until_must_be_after_the_current_day

  # the total_cost must be greater than 0.
  validates :total_cost, numericality: { greater_than: 0 }
  
  # custom method which determines if credit_card_valid_until is after the current day.
  def credit_card_valid_until_must_be_after_the_current_day
    if credit_card_valid_until != nil && credit_card_valid_until <= Date.today
      errors.add(:credit_card_valid_until, 'must be after the current day')
    end
  end

  # each order belongs to a customer
  belongs_to :customer

  # Each order contains 1 or more line_items
  # The line items in an order should be destroyed if the order is destroyed.
  has_many :line_items, dependent: :destroy

  # Scope which is used to return all orders which a specific customer owns
  # Used so that each customer can only see their own orders
  scope :customer_orders, ->(customer) { where(['customer_id = ?', customer.id]) }

end
