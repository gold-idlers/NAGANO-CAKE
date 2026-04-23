require "test_helper"

class Public::CartItemsControllerTest < ActionDispatch::IntegrationTest
  include CustomerSignInHelper

  setup do
    @customer = customers(:one)
    sign_in_as_customer(@customer)
  end

  test "should get index" do
    get public_cart_items_index_url
    assert_response :success
  end

  test "should get create" do
    post cart_items_url, params: { cart_item: { item_id: items(:one).id, amount: 1 } }
    assert_response :redirect
  end

  test "should get update" do
    patch cart_item_url(cart_items(:one)), params: { cart_item: { amount: 2 } }
    assert_response :redirect
  end

  test "should get destroy" do
    delete cart_item_url(cart_items(:one))
    assert_response :redirect
  end

  test "should get destroy_all" do
    delete destroy_all_cart_items_url
    assert_response :redirect
  end
end
