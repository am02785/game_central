require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Cvv", with: @order.CVV
    fill_in "Credit card number", with: @order.credit_card_number
    fill_in "Credit card valid until", with: @order.credit_card_valid_until
    fill_in "Customer", with: @order.customer_id
    fill_in "Delivery date", with: @order.delivery_date
    fill_in "Name on credit card", with: @order.name_on_credit_card
    fill_in "Total cost", with: @order.total_cost
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Cvv", with: @order.CVV
    fill_in "Credit card number", with: @order.credit_card_number
    fill_in "Credit card valid until", with: @order.credit_card_valid_until
    fill_in "Customer", with: @order.customer_id
    fill_in "Delivery date", with: @order.delivery_date
    fill_in "Name on credit card", with: @order.name_on_credit_card
    fill_in "Total cost", with: @order.total_cost
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
