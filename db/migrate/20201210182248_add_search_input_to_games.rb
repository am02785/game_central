class AddSearchInputToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :search_input, :string
  end
end
