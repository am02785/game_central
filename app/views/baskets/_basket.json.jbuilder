json.extract! basket, :id, :total_cost, :created_at, :updated_at
json.url basket_url(basket, format: :json)
