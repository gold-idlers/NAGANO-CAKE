require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  include AdminSignInHelper

  setup do
    @admin = admins(:one)
    sign_in_as_admin(@admin)
  end

  test "should get show" do
    get admin_order_url(orders(:one))
    assert_response :success
  end

  test "should get update" do
    patch admin_order_url(orders(:one)), params: { order: { status: "入金確認" } }
    assert_response :redirect
  end
end
