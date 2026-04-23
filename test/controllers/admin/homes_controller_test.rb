require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  include AdminSignInHelper

  setup do
    @admin = admins(:one)
    sign_in_as_admin(@admin)
  end

  test "should get top" do
    get admin_top_url
    assert_response :success
  end
end
