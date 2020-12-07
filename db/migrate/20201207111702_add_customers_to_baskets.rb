class AddCustomersToBaskets < ActiveRecord::Migration[5.2]
  def up
    add_reference :baskets, :customer, index: true
    change_column_null :baskets, :customer_id, false
    add_foreign_key :baskets, :customers
  end


  def down
    remove_foreign_key :baskets, :customers
    remove_reference :baskets, :customer, index: true
  end
end
