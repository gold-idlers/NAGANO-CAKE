require "test_helper"

class Admin::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  include AdminSignInHelper

  setup do
    @admin = admins(:one)
    sign_in_as_admin(@admin)
  end

  test "should get update" do
    patch admin_order_detail_url(order_id: orders(:one).id, id: order_details(:one).id), params: { order_detail: { making_status: "製作待ち" } }
    assert_response :redirect
  end
end
