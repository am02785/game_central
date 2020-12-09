json.extract! order, :id, :customer_id, :name_on_credit_card, :CVV, :credit_card_number, :credit_card_valid_until, :delivery_date, :total_cost, :created_at, :updated_at
json.url order_url(order, format: :json)
