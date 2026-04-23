require "test_helper"

class Public::OrdersControllerTest < ActionDispatch::IntegrationTest
  include CustomerSignInHelper

  setup do
    @customer = customers(:one)
    sign_in_as_customer(@customer)
  end

  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get confirm" do
    post orders_confirm_url, params: { order: { postal_code: "123-4567", address: "Tokyo", name: "Test Name" } }
    assert_response :success
  end

  test "should get thanks" do
    get orders_thanks_url
    assert_response :success
  end

  test "should get create" do
    post orders_url, params: { order: { postal_code: "123-4567", address: "Tokyo", name: "Test Name" } }
    assert_response :redirect
  end

  test "should get index" do
    get public_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get order_url(orders(:one))
    assert_response :success
  end
end
