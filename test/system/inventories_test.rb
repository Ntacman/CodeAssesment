require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "creating a Inventory" do
    visit inventories_url
    click_on "New Inventory"

    fill_in "Color", with: @inventory.color
    fill_in "Cost cents", with: @inventory.cost_cents
    fill_in "Height", with: @inventory.height
    fill_in "Length", with: @inventory.length
    fill_in "Note", with: @inventory.note
    fill_in "Price cents", with: @inventory.price_cents
    fill_in "Product", with: @inventory.product_id
    fill_in "Quantity", with: @inventory.quantity
    fill_in "Sale price cents", with: @inventory.sale_price_cents
    fill_in "Size", with: @inventory.size
    fill_in "Sku", with: @inventory.sku
    fill_in "Weight", with: @inventory.weight
    fill_in "Width", with: @inventory.width
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "updating a Inventory" do
    visit inventories_url
    click_on "Edit", match: :first

    fill_in "Color", with: @inventory.color
    fill_in "Cost cents", with: @inventory.cost_cents
    fill_in "Height", with: @inventory.height
    fill_in "Length", with: @inventory.length
    fill_in "Note", with: @inventory.note
    fill_in "Price cents", with: @inventory.price_cents
    fill_in "Product", with: @inventory.product_id
    fill_in "Quantity", with: @inventory.quantity
    fill_in "Sale price cents", with: @inventory.sale_price_cents
    fill_in "Size", with: @inventory.size
    fill_in "Sku", with: @inventory.sku
    fill_in "Weight", with: @inventory.weight
    fill_in "Width", with: @inventory.width
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "destroying a Inventory" do
    visit inventories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inventory was successfully destroyed"
  end
end
