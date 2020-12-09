class ChangeBasketIdInLineItemsToNullable < ActiveRecord::Migration[5.2]
  def change
    change_column :line_items, :basket_id, :integer, null: true
  end
end
