class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.belongs_to :game, foreign_key: true, null: false
      t.belongs_to :basket, foreign_key: true, null: false

      t.timestamps
    end
  end
end
