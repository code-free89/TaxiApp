require 'test_helper'

class PassengersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passenger = passengers(:one)
  end

  test "should get index_editable" do
    get passengers_url
    assert_response :success
  end

  test "should get new" do
    get new_passenger_url
    assert_response :success
  end

  test "should create passenger" do
    assert_difference('Passenger.count') do
      post passengers_url, params: { passenger: {  } }
    end

    assert_redirected_to passenger_url(Passenger.last)
  end

  test "should show passenger" do
    get passenger_url(@passenger)
    assert_response :success
  end

  test "should get edit" do
    get edit_passenger_url(@passenger)
    assert_response :success
  end

  test "should update passenger" do
    patch passenger_url(@passenger), params: { passenger: {  } }
    assert_redirected_to passenger_url(@passenger)
  end

  test "should destroy passenger" do
    assert_difference('Passenger.count', -1) do
      delete passenger_url(@passenger)
    end

    assert_redirected_to passengers_url
  end
end
