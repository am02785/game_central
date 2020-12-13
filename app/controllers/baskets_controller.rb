class BasketsController < ApplicationController
  # the set_basket method is called before the show action method and the destroy action method
  before_action :set_basket, only: [:show, :destroy]
  # restricts access to the baskets
  before_action :authenticate_customer!

  # The show action which gets the page which shows the customers basket to the customer
  # GET /baskets/1
  # GET /baskets/1.json
  def show
  end

  # The create action which creates the basket which the current customer owns
  # POST /baskets
  # POST /baskets.json
  def create
    # creates a new basket which has a total_cost of 0 and is owned by the current customer who is logged in
    @basket = Basket.new({total_cost: 0, customer_id: current_customer.id})

    respond_to do |format|
      # saves the basket
      @basket.save
      # the customer is redirected to the page which shows the customers basket to the customer
      format.html { redirect_to @basket }
      format.json { render :show, status: :created, location: @basket }
    end
  end

  # the destroy action which destroys the basket owned by the customer when the customer is removed
  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    # destroys the basket
    @basket.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    # sets the current basket which is owned by the customer.
    def set_basket
      # finds the current basket using the params
      @basket = Basket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # creates the strong parameters for baskets.
    def basket_params
      params.require(:basket).permit(:total_cost, :customer_id)
    end
end
