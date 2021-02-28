require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Admin", with: @product.admin_id
    fill_in "Brand", with: @product.brand
    fill_in "Description", with: @product.description
    fill_in "Note", with: @product.note
    fill_in "Product name", with: @product.product_name
    fill_in "Product type", with: @product.product_type
    fill_in "Shipping price", with: @product.shipping_price
    fill_in "Style", with: @product.style
    fill_in "Url", with: @product.url
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @product.admin_id
    fill_in "Brand", with: @product.brand
    fill_in "Description", with: @product.description
    fill_in "Note", with: @product.note
    fill_in "Product name", with: @product.product_name
    fill_in "Product type", with: @product.product_type
    fill_in "Shipping price", with: @product.shipping_price
    fill_in "Style", with: @product.style
    fill_in "Url", with: @product.url
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
