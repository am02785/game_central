class LineItemsController < ApplicationController
  before_action :set_line_item, only: :destroy
  # call set_cart on LineItem create and LineItem destroy
  before_action :set_basket, only: [:create, :destroy]
  # restricts access to the line items
  before_action :authenticate_customer!

  # POST /line_items
  # POST /line_items.json
  def create
    # builds a LineItem object, setting the basket and the game
    game = Game.find(params[:game_id])
    @line_item = @basket.line_items.build(game: game)

    respond_to do |format|
      if @line_item.save
        # the total cost of the basket should be increased by the price of the game
        @basket.total_cost += game.price
        @basket.save
        # the user should be redirected to the basket.
        format.html { redirect_to @line_item.basket, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to game_line_items_url, notice: 'Line item was successfully destroyed.' }
      # used to handle a javascript response.
      format.js
      format.json { head :no_content }
    end
    # the total cost of the basket should be decreased by the price of the game
    @basket.total_cost -= @line_item.game.price
    @basket.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

  # finds the current basket. If there isn't one, one is created.
  def set_basket
    @basket = Basket.find(session[:basket_id])
  rescue ActiveRecord::RecordNotFound
    @basket = Basket.create( {total_cost: 0} )
    session[:basket_id] = @basket.id
  end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:game_id, :basket_id)
    end
end
