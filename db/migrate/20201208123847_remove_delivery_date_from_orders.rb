class RemoveDeliveryDateFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delivery_date
  end
end
