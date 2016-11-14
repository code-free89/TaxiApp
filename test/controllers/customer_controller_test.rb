require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_new_url
    assert_response :success
  end

  test "should get create" do
    get customer_create_url
    assert_response :success
  end

  test "should get update" do
    get customer_update_url
    assert_response :success
  end

  test "should get edit" do
    get customer_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_destroy_url
    assert_response :success
  end

  test "should get index_editable" do
    get customer_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_show_url
    assert_response :success
  end

end
