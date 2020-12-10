class GamesController < ApplicationController
  before_action :set_game, only: :show

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    # sorts the games by alphabetical order
    @games = @games.sort_by(&:title)
  end

  def search
    @games = Game.search_games(params[:search_input])
    # sorts the games by alphabetical order
    @games = @games.sort_by(&:title)
  end

  def nintendo_switch_games
    @games = Game.nintendo_switch_games
    # sorts the games by alphabetical order
    @games = @games.sort_by(&:title)
  end

  def ps5_games
    @games = Game.ps5_games
    # sorts the games by alphabetical order
    @games = @games.sort_by(&:title)
  end

  def xbox_series_x_games
    @games = Game.xbox_series_x_games
    # sorts the games by alphabetical order
    @games = @games.sort_by(&:title)
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:title, :description, :image_url, :price, :release_date, :search_input)
    end
end
