class LineItemsController < ApplicationController
  # the set_line_item method is called before the destroy action method
  before_action :set_line_item, only: :destroy
  # the set_basket method is called before the create action method and the destroy action method
  before_action :set_basket, only: [:create, :destroy]
  # restricts access to the line items
  before_action :authenticate_customer!

  # The create action which creates a line_item that is added to the basket which the current customer owns
  # POST /games/line_items
  # POST /games/line_items.json
  def create
    # builds a LineItem object, setting the basket and the game
    game = Game.find(params[:game_id])
    @line_item = @basket.line_items.build(game: game)

    respond_to do |format|
      # saves the line_item
      @line_item.save
      # the total cost of the basket is increased by the price of the game
      @basket.total_cost += game.price
      # saves the basket because the total cost of the basket has been updated
      @basket.save
      # the user should be redirected to the page which shows the current customers basket
      format.html { redirect_to @line_item.basket }
      format.json { render :show, status: :created, location: @line_item }
    end
  end

  # the destroy action which destroys a line_item removed from the current customers basket
  # DELETE /games/line_items/1
  # DELETE /games/line_items/1.json
  def destroy
    # destroys the line_item
    @line_item.destroy
    respond_to do |format|
      # the user is redirected to game_line_items url
      format.html { redirect_to game_line_items_url }
      # AJAX is used to destroy the line item and remove it from the basket view without being
      # redirected to a list of line items
      # format.js is used to handle a javascript response.
      format.js
      format.json { head :no_content }
    end
    # the total cost of the basket is decreased by the price of the game
    @basket.total_cost -= @line_item.game.price
    # saves the basket because the total cost of the basket has been updated
    @basket.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # sets the current line_item.
    def set_line_item
      # finds the current line_item using the params
      @line_item = LineItem.find(params[:id])
    end

  # finds the basket which the current customer owns.
  # if the current customer does not own one, one is created for the customer.
  def set_basket
    if current_customer.basket
      # attempts to find the basket which the current customer owns
      @basket = current_customer.basket
    else
      # if the current customer does not own a basket, a basket is created for the customer which has
      # a total_cost of 0 and a customer_id equal to the current customers id
      @basket = Basket.create( {total_cost: 0, customer_id: current_customer.id} )
    end
  end

    # Only allow a list of trusted parameters through.
    # creates the strong parameters for line_items.
    def line_item_params
      params.require(:line_item).permit(:game_id, :basket_id)
    end
end
