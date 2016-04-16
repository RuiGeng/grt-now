require 'test_helper'

class VehicleStopTimesControllerTest < ActionController::TestCase
  setup do
    @vehicle_stop_time = vehicle_stop_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_stop_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_stop_time" do
    assert_difference('VehicleStopTime.count') do
      post :create, vehicle_stop_time: { departure_time: @vehicle_stop_time.departure_time, sequence: @vehicle_stop_time.sequence, trip_id: @vehicle_stop_time.trip_id, vehicle_stop_id: @vehicle_stop_time.vehicle_stop_id }
    end

    assert_redirected_to vehicle_stop_time_path(assigns(:vehicle_stop_time))
  end

  test "should show vehicle_stop_time" do
    get :show, id: @vehicle_stop_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle_stop_time
    assert_response :success
  end

  test "should update vehicle_stop_time" do
    patch :update, id: @vehicle_stop_time, vehicle_stop_time: { departure_time: @vehicle_stop_time.departure_time, sequence: @vehicle_stop_time.sequence, trip_id: @vehicle_stop_time.trip_id, vehicle_stop_id: @vehicle_stop_time.vehicle_stop_id }
    assert_redirected_to vehicle_stop_time_path(assigns(:vehicle_stop_time))
  end

  test "should destroy vehicle_stop_time" do
    assert_difference('VehicleStopTime.count', -1) do
      delete :destroy, id: @vehicle_stop_time
    end

    assert_redirected_to vehicle_stop_times_path
  end
end
