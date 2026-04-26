require "test_helper"

class Public::AddressesControllerTest < ActionDispatch::IntegrationTest
  include CustomerSignInHelper

  setup do
    @customer = customers(:one)
    sign_in_as_customer(@customer)
  end

  test "should get index" do
    get public_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(addresses(:one))
    assert_response :success
  end

  test "should get create" do
    post addresses_url, params: { address: { postal_code: "123-4567", address: "Tokyo", name: "Test" } }
    assert_response :redirect
  end

  test "should get update" do
    patch address_url(addresses(:one)), params: { address: { postal_code: "123-4567", address: "Osaka", name: "Updated" } }
    assert_response :redirect
  end

  test "should get destroy" do
    delete address_url(addresses(:one))
    assert_response :redirect
  end
end
