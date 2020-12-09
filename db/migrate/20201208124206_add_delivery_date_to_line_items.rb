class AddDeliveryDateToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :delivery_date, :date
  end
end
