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

    fill_in "Apartment", with: @order.apartment
    fill_in "City", with: @order.city
    fill_in "Country code", with: @order.country_code
    fill_in "Email", with: @order.email
    fill_in "Name", with: @order.name
    fill_in "Order status", with: @order.order_status
    fill_in "Payment amt cents", with: @order.payment_amt_cents
    fill_in "Payment date", with: @order.payment_date
    fill_in "Payment ref", with: @order.payment_ref
    fill_in "Phone number", with: @order.phone_number
    fill_in "Product", with: @order.product_id
    fill_in "Ship charged cents", with: @order.ship_charged_cents
    fill_in "Ship cost cents", with: @order.ship_cost_cents
    fill_in "Shipped date", with: @order.shipped_date
    fill_in "Shipper name", with: @order.shipper_name
    fill_in "State", with: @order.state
    fill_in "Street address", with: @order.street_address
    fill_in "Subtotal cents", with: @order.subtotal_cents
    fill_in "Tax total cents", with: @order.tax_total_cents
    fill_in "Total cents", with: @order.total_cents
    fill_in "Tracking number", with: @order.tracking_number
    fill_in "Transaction", with: @order.transaction_id
    fill_in "Zip", with: @order.zip
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Apartment", with: @order.apartment
    fill_in "City", with: @order.city
    fill_in "Country code", with: @order.country_code
    fill_in "Email", with: @order.email
    fill_in "Name", with: @order.name
    fill_in "Order status", with: @order.order_status
    fill_in "Payment amt cents", with: @order.payment_amt_cents
    fill_in "Payment date", with: @order.payment_date
    fill_in "Payment ref", with: @order.payment_ref
    fill_in "Phone number", with: @order.phone_number
    fill_in "Product", with: @order.product_id
    fill_in "Ship charged cents", with: @order.ship_charged_cents
    fill_in "Ship cost cents", with: @order.ship_cost_cents
    fill_in "Shipped date", with: @order.shipped_date
    fill_in "Shipper name", with: @order.shipper_name
    fill_in "State", with: @order.state
    fill_in "Street address", with: @order.street_address
    fill_in "Subtotal cents", with: @order.subtotal_cents
    fill_in "Tax total cents", with: @order.tax_total_cents
    fill_in "Total cents", with: @order.total_cents
    fill_in "Tracking number", with: @order.tracking_number
    fill_in "Transaction", with: @order.transaction_id
    fill_in "Zip", with: @order.zip
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
