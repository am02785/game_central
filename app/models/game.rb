# The game model which represents the video games which the customers buy from the online store.
class Game < ApplicationRecord
  # The title of the game must not be null.
  validates :title, presence: true
  # The title of a video game is assumed to be unique.
  validates :title, uniqueness: true
  # The description of the game must not be null.
  validates :description, presence: true
  # The image_url of the game must not be null.
  validates :image_url, presence: true
  # The price of the game must not be null.
  validates :price, presence: true
  # The price of the game must greater than 0.
  validates :price, numericality: {greater_than: 0}
  # The release_date of the game must not be null.
  validates :release_date, presence: true
  # The game_console of the game must not be null.
  validates :game_console, presence: true
  # The game_console of the game must either be Nintendo Switch, PS5, or Xbox Series X.
  validates :game_console, inclusion: { in: ['Nintendo Switch', 'PS5', 'Xbox Series X'] }

  # A game can be in 0 or more line items.
  has_many :line_items

  # Scope used to search for a game with a name like the user input
  scope :search_games, ->(input) { where(["Lower(title) LIKE ?", "%#{input}%"]) }
  # Scope used to retrieve all games for the Nintendo Switch
  scope :nintendo_switch_games, -> { where game_console: 'Nintendo Switch'}
  # Scope used to retrieve all games for the PS5
  scope :ps5_games, -> { where game_console: 'PS5'}
  # Scope used to retrieve all games for the Xbox Series X
  scope :xbox_series_x_games, -> { where game_console: 'Xbox Series X'}

end
