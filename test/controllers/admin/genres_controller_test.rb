require "test_helper"

class Admin::GenresControllerTest < ActionDispatch::IntegrationTest
  include AdminSignInHelper

  setup do
    @admin = admins(:one)
    sign_in_as_admin(@admin)
  end

  test "should get index" do
    get admin_genres_index_url
    assert_response :success
  end

  test "should get create" do
    post admin_genres_url, params: { genre: { name: "Test Genre" } }
    assert_response :redirect
  end

  test "should get edit" do
    get edit_admin_genre_url(genres(:one))
    assert_response :success
  end

  test "should get update" do
    patch admin_genre_url(genres(:one)), params: { genre: { name: "Updated Genre" } }
    assert_response :redirect
  end
end
