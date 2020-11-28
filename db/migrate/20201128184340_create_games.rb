class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price
      t.date :release_date

      t.timestamps
    end
  end
end
