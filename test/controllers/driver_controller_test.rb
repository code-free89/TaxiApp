require 'test_helper'

class DriverControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get driver_new_url
    assert_response :success
  end

  test "should get create" do
    get driver_create_url
    assert_response :success
  end

  test "should get update" do
    get driver_update_url
    assert_response :success
  end

  test "should get edit" do
    get driver_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get driver_destroy_url
    assert_response :success
  end

  test "should get index_editable" do
    get driver_index_url
    assert_response :success
  end

  test "should get show" do
    get driver_show_url
    assert_response :success
  end

end
