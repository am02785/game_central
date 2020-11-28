class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image_url, null: false
      t.decimal :price, null: false
      t.date :release_date, null: false

      t.timestamps
    end
  end
end
