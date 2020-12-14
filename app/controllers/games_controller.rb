class GamesController < ApplicationController
  # the set_game method is called before the show action method
  before_action :set_game, only: :show

  # The index action which gets the page which shows the customer all the games which are in the database
  # GET /games
  # GET /games.json
  def index
    # retrieves all the games in the database
    @games = Game.all
    # sorts the games by title in alphabetical order
    @games = @games.sort_by(&:title)
  end

  # The nintendo_switch_games action which gets the page which shows the customer all the games for the Nintendo Switch
  # GET /nintendo_switch_games
  # GET /nintendo_switch_games.json
  def nintendo_switch_games
    # uses the nintendo_switch_games scope to retrieve all the games for the Nintendo Switch
    @games = Game.nintendo_switch_games
    # sorts the games by title in alphabetical order
    @games = @games.sort_by(&:title)
  end

  # The ps5_games action which gets the page which shows the customer all the games for the PS5
  # GET /ps5_games
  # GET /ps5_games.json
  def ps5_games
    # uses the ps5_games scope to retrieve all the games for the PS5
    @games = Game.ps5_games
    # sorts the games by title in alphabetical order
    @games = @games.sort_by(&:title)
  end

  # The xbox_series_x_games action which gets the page which shows the customer all the games for the Xbox Series X
  # GET /xbox_series_x_games
  # GET /xbox_series_x_games.json
  def xbox_series_x_games
    # uses the xbox_series_x_games scope to retrieve all the games for the Xbox Series X
    @games = Game.xbox_series_x_games
    # sorts the games by title in alphabetical order
    @games = @games.sort_by(&:title)
  end

  # The show action which gets the page which shows the current game to the customer
  # GET /games/1
  # GET /games/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # sets the current game.
    def set_game
      # finds the current game using the params
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # creates the strong parameters for games.
    def game_params
      params.require(:game).permit(:title, :description, :image_url, :price, :release_date, :search_input)
    end
end
