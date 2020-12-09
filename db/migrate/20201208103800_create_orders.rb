class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, foreign_key: true, null: false
      t.string :name_on_credit_card, null: false
      t.string :CVV, null: false
      t.string :credit_card_number, null: false
      t.date :credit_card_valid_until, null: false
      t.date :delivery_date, null: false
      t.decimal :total_cost, null: false

      t.timestamps
    end
  end
end
