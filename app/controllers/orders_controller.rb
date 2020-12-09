class OrdersController < ApplicationController
  before_action :set_order, only: :show
  # restricts access to the orders
  before_action :authenticate_customer!

  # GET /orders
  # GET /orders.json
  def index
    # customer_orders scope used to retrieve all the orders that belong to the current customer
    @orders = Order.customer_orders(current_customer)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = current_customer.orders.new
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_customer.orders.new(order_params)
    # calculates the total_cost of the order based on the line_items it contains
    # and sets the order_id and delivery_date of the line_items
    @order.total_cost = 0
    current_customer.basket.line_items.each do |item|
      @order.total_cost += item.game.price
      item.order_id = Order.last.id + 1
      item.basket_id = nil
      current_customer.basket.total_cost -= item.game.price
      # if a game has been released, the delivery_date is the next day
      # if a game has not been released, the delivery_date is the release_date of the game
      if item.game.release_date <= Date.today
        item.delivery_date = Date.today + 1
      else
        item.delivery_date = item.game.release_date
       end
    end

    respond_to do |format|
      if @order.save
        LineItem.transaction do
          current_customer.basket.line_items.each(&:save!)
        end
        current_customer.basket.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:customer_id, :name_on_credit_card, :CVV, :credit_card_number, :credit_card_valid_until, :delivery_date, :total_cost)
    end
end
