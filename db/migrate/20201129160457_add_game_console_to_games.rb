class AddGameConsoleToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :game_console, :string, null: false
  end
end
