class GamesController < ApplicationController
  before_action :set_game, only: :show

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
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
      params.require(:game).permit(:title, :description, :image_url, :price, :release_date)
    end
end
