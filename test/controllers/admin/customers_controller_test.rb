require "test_helper"

class Admin::CustomersControllerTest < ActionDispatch::IntegrationTest
  include AdminSignInHelper

  setup do
    @admin = admins(:one)
    sign_in_as_admin(@admin)
  end

  test "should get index" do
    get admin_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_customer_url(customers(:one))
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_customer_url(customers(:one))
    assert_response :success
  end

  test "should get update" do
    patch admin_customer_update_url(customers(:one)), params: { customer: { email_address: customers(:one).email_address } }
    assert_response :redirect
  end
end
