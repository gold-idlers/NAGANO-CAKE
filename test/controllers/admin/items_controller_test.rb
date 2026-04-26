require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  include AdminSignInHelper

  setup do
    @admin = admins(:one)
    sign_in_as_admin(@admin)
  end

  test "should get index" do
    get admin_items_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_items_new_url
    assert_response :success
  end

  test "should get create" do
    post admin_items_url, params: { item: { name: "Test Item", introduction: "Test intro", genre_id: genres(:one).id, price: 100, is_active: true } }
    assert_response :redirect
  end

  test "should get show" do
    get admin_item_url(items(:one))
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_item_url(items(:one))
    assert_response :success
  end

  test "should get update" do
    patch admin_item_url(items(:one)), params: { item: { name: "Updated Item", introduction: "Updated intro", genre_id: genres(:one).id, price: 200, is_active: true } }
    assert_response :redirect
  end
end
