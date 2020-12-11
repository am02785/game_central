class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :destroy]
  # restricts access to the baskets
  before_action :authenticate_customer!

  # GET /baskets/1
  # GET /baskets/1.json
  def show
  end

  # POST /baskets
  # POST /baskets.json
  def create
    @basket = Basket.new({total_cost: 0, customer_id: current_customer.id})

    respond_to do |format|
      @basket.save
      format.html { redirect_to @basket}
      format.json { render :show, status: :created, location: @basket }
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket
      @basket = Basket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basket_params
      params.require(:basket).permit(:total_cost, :customer_id)
    end
end
