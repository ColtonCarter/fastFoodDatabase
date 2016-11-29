require 'test_helper'

class InvoiceHasProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_has_product = invoice_has_products(:one)
  end

  test "should get index" do
    get invoice_has_products_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_has_product_url
    assert_response :success
  end

  test "should create invoice_has_product" do
    assert_difference('InvoiceHasProduct.count') do
      post invoice_has_products_url, params: { invoice_has_product: { order_id: @invoice_has_product.order_id, product_id: @invoice_has_product.product_id, product_quantity: @invoice_has_product.product_quantity } }
    end

    assert_redirected_to invoice_has_product_url(InvoiceHasProduct.last)
  end

  test "should show invoice_has_product" do
    get invoice_has_product_url(@invoice_has_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_has_product_url(@invoice_has_product)
    assert_response :success
  end

  test "should update invoice_has_product" do
    patch invoice_has_product_url(@invoice_has_product), params: { invoice_has_product: { order_id: @invoice_has_product.order_id, product_id: @invoice_has_product.product_id, product_quantity: @invoice_has_product.product_quantity } }
    assert_redirected_to invoice_has_product_url(@invoice_has_product)
  end

  test "should destroy invoice_has_product" do
    assert_difference('InvoiceHasProduct.count', -1) do
      delete invoice_has_product_url(@invoice_has_product)
    end

    assert_redirected_to invoice_has_products_url
  end
end
