class OrdersController < ApplicationController
  # the set_order method is called before the show action method
  before_action :set_order, only: :show
  # restricts access to the orders
  before_action :authenticate_customer!

  # the index action which gets the page which shows the current customer all the orders they have made
  # GET /orders
  # GET /orders.json
  def index
    # uses the customer_orders scope to retrieve all the orders that the current customer has made
    @orders = Order.customer_orders(current_customer)
  end

  # the show action which gets the page which shows the current order to the customer
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # the new action which gets the page that contains the form which allows the customer to create a new order
  # GET /orders/new
  def new
    # sets the current order to be the new order which the current customer is creating
    @order = current_customer.orders.new
  end




  # the create action which creates the order which is made by the current customer
  # POST /orders
  # POST /orders.json
  def create
    # creates a new order which belongs to the current customer and contains fields which have values equal to
    # parameters accessed from the order_params hash
    @order = current_customer.orders.new(order_params)
    # sets the total_cost of the order to 0
    @order.total_cost = 0
    # calculates the total_cost of the order by calculating the sum of the cost of the line_items which the
    # basket that the current customer owns contains
    current_customer.basket.line_items.each do |item|
      # the total_cost of the order must be increased by the price of the game which the line_item belongs to
      @order.total_cost += item.game.price
      # the order_id of the line_item is equal to the id of the order which is currently being created
      item.order_id = Order.last.id + 1
      # the basket_id of the line_item is set to nil because the line_item is removed from the basket which
      # belongs to the current customer and is added to the order
      item.basket_id = nil
      # the total cost of the basket which the current customer owns is decreased by the price of the game which
      # the line_item belongs to
      current_customer.basket.total_cost -= item.game.price
      # if a game has been released, the delivery_date of the line_item is the next day
      # if a game has not been released, the delivery_date of the line_item is the release_date of the game
      # which the line_item belongs to
      if item.game.release_date <= Date.today
        # the delivery_date of the line_item is the next day
        item.delivery_date = Date.today + 1
      else
        # the delivery_date of the line_item is the release_date of the game which the line_item belongs to
        item.delivery_date = item.game.release_date
       end
    end

    respond_to do |format|
      # attempts to save the order
      if @order.save
        # if the order has successfully been saved, each line_item in the basket which the current customer
        # owns is saved because the value of the fields which the line_items contain is updated
        LineItem.transaction do
          current_customer.basket.line_items.each(&:save!)
        end
        # if the order has successfully been saved, the basket which the current customer owns is saved
        # because the total_cost of the basket is updated
        current_customer.basket.save
        # if the order has successfully been saved, the current customer should be redirected to the page which
        # shows the order that the current_customer has made
        format.html { redirect_to @order }
        format.json { render :show, status: :created, location: @order }
      else
        # if the order has not successfully been saved, the current customer should not be redirected to another
        # page and should be shown the errors which prevented the order from being saved
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # sets the current order.
    def set_order
      # finds the current order using the params
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # creates the strong parameters for orders.
    def order_params
      params.require(:order).permit(:customer_id, :name_on_credit_card, :CVV, :credit_card_number, :credit_card_valid_until, :delivery_date, :total_cost)
    end
end
