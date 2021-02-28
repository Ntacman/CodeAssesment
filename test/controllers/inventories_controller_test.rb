require "test_helper"

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post inventories_url, params: { inventory: { color: @inventory.color, cost_cents: @inventory.cost_cents, height: @inventory.height, length: @inventory.length, note: @inventory.note, price_cents: @inventory.price_cents, product_id: @inventory.product_id, quantity: @inventory.quantity, sale_price_cents: @inventory.sale_price_cents, size: @inventory.size, sku: @inventory.sku, weight: @inventory.weight, width: @inventory.width } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { color: @inventory.color, cost_cents: @inventory.cost_cents, height: @inventory.height, length: @inventory.length, note: @inventory.note, price_cents: @inventory.price_cents, product_id: @inventory.product_id, quantity: @inventory.quantity, sale_price_cents: @inventory.sale_price_cents, size: @inventory.size, sku: @inventory.sku, weight: @inventory.weight, width: @inventory.width } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end
end
