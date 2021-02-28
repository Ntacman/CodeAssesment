require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { apartment: @order.apartment, city: @order.city, country_code: @order.country_code, email: @order.email, name: @order.name, order_status: @order.order_status, payment_amt_cents: @order.payment_amt_cents, payment_date: @order.payment_date, payment_ref: @order.payment_ref, phone_number: @order.phone_number, product_id: @order.product_id, ship_charged_cents: @order.ship_charged_cents, ship_cost_cents: @order.ship_cost_cents, shipped_date: @order.shipped_date, shipper_name: @order.shipper_name, state: @order.state, street_address: @order.street_address, subtotal_cents: @order.subtotal_cents, tax_total_cents: @order.tax_total_cents, total_cents: @order.total_cents, tracking_number: @order.tracking_number, transaction_id: @order.transaction_id, zip: @order.zip } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { apartment: @order.apartment, city: @order.city, country_code: @order.country_code, email: @order.email, name: @order.name, order_status: @order.order_status, payment_amt_cents: @order.payment_amt_cents, payment_date: @order.payment_date, payment_ref: @order.payment_ref, phone_number: @order.phone_number, product_id: @order.product_id, ship_charged_cents: @order.ship_charged_cents, ship_cost_cents: @order.ship_cost_cents, shipped_date: @order.shipped_date, shipper_name: @order.shipper_name, state: @order.state, street_address: @order.street_address, subtotal_cents: @order.subtotal_cents, tax_total_cents: @order.tax_total_cents, total_cents: @order.total_cents, tracking_number: @order.tracking_number, transaction_id: @order.transaction_id, zip: @order.zip } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
