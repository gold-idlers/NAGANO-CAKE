require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  include CustomerSignInHelper

  setup do
    @customer = customers(:one)
    sign_in_as_customer(@customer)
  end

  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    patch "/customers/information", params: { customer: { email_address: @customer.email_address } }
    assert_response :redirect
  end

  test "should get unsubscribe" do
    get public_customers_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get public_customers_withdraw_url
    assert_response :redirect
  end
end
