class AddIndexToGames < ActiveRecord::Migration[5.2]
  def change
    add_index :games, :title, unique: true
  end
end
