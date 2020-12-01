class AddCreditCardNumberToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :credit_card_number, :string, null: false
  end
end
