require 'test_helper'

class FarmProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get farm_products_new_url
    assert_response :success
  end

  test "should get create" do
    get farm_products_create_url
    assert_response :success
  end

  test "should get edit" do
    get farm_products_edit_url
    assert_response :success
  end

  test "should get update" do
    get farm_products_update_url
    assert_response :success
  end

  test "should get show" do
    get farm_products_show_url
    assert_response :success
  end

end
