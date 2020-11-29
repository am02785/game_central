require 'test_helper'

# tests the game model
class GameTest < ActiveSupport::TestCase

  # tests whether an empty game cannot be saved
  test 'should not save empty game' do
    game = Game.new # creates a new game

    game.save # attempts to save the game
    refute game.valid? # the game should not be saved
  end

  # tests whether a valid game can be saved
  test 'should save valid game' do
    game = Game.new # creates a new game
    game.title = 'My Game' # sets the title of the game
    game.description = 'My Game is very special' # sets the description of the game
    game.image_url = 'image_url.jpg' # sets the image_url of the game
    game.price = 49.99 # sets the price of the game
    game.release_date = Date.new(2020,1,1) # sets the release_date of the game
    game.game_console = 'Nintendo Switch' # sets the game_console of the game

    game.save # attempts to save the game
    assert game.valid? # the game should be saved
  end

  # tests whether a game with a duplicate title cannot be saved
  test 'should not save duplicate game title' do
    game1 = Game.new # creates a new game called game1
    game1.title = 'My Game' # sets the title of game1
    game1.description = 'My Game is very special' # sets the description of game1
    game1.image_url = 'image_url.jpg' # sets the image_url of game1
    game1.price = 49.99 # sets the price of game1
    game1.release_date = Date.new(2020,1,1) # sets the release_date of game1
    game1.game_console = 'Nintendo Switch' # sets the game_console of game1
    game1.save # attempts to save the game1
    assert game1.valid? # game1 should be saved

    game2 = Game.new # creates a new game called game2
    game2.title = 'My Game' # sets the title of game2 which is the same as the title for game1
    game2.description = 'My Game is very special' # sets the description of game3
    game2.image_url = 'image_url.jpg' # sets the image_url of game2
    game2.price = 49.99 # sets the price of game2
    game2.release_date = Date.new(2020,1,1) # sets the release_date of game2
    game2.game_console = 'Nintendo Switch' # sets the game_console of game2
    game2.save # attempts to save the game2
    refute game2.valid? # game2 should not be saved
  end

  # tests whether a game with an invalid price cannot be saved
  test 'should not save game with invalid price' do
    game = Game.new # creates a new game
    game.title = 'My Game' # sets the title of the game
    game.description = 'My Game is very special' # sets the description of the game
    game.image_url = 'image_url.jpg' # sets the image_url of the game
    game.price = 0 # sets the price of the game to an invalid value
    game.release_date = Date.new(2020,1,1) # sets the release_date of the game
    game.game_console = 'Nintendo Switch' # sets the game_console of the game

    game.save # attempts to save the game
    refute game.valid? # the game should not be saved
  end

  # tests whether a game with an invalid game_console cannot be saved
  test 'should not save game with invalid game_console' do
    game = Game.new # creates a new game
    game.title = 'My Game' # sets the title of the game
    game.description = 'My Game is very special' # sets the description of the game
    game.image_url = 'image_url.jpg' # sets the image_url of the game
    game.price = 49.99 # sets the price of the game
    game.release_date = Date.new(2020,1,1) # sets the release_date of the game
    game.game_console = 'My Game Console' # sets the game_console of the game to an invalid value

    game.save # attempts to save the game
    refute game.valid? # the game should not be saved
  end

end
