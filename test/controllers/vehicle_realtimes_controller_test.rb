require 'test_helper'

class VehicleRealtimesControllerTest < ActionController::TestCase
  setup do
    @vehicle_realtime = vehicle_realtimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_realtimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_realtime" do
    assert_difference('VehicleRealtime.count') do
      post :create, vehicle_realtime: { current_status: @vehicle_realtime.current_status, lat: @vehicle_realtime.lat, long: @vehicle_realtime.long, vehicle_route_id: @vehicle_realtime.vehicle_route_id, vehicle_stop_id: @vehicle_realtime.vehicle_stop_id, vehicle_trip_id: @vehicle_realtime.vehicle_trip_id }
    end

    assert_redirected_to vehicle_realtime_path(assigns(:vehicle_realtime))
  end

  test "should show vehicle_realtime" do
    get :show, id: @vehicle_realtime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle_realtime
    assert_response :success
  end

  test "should update vehicle_realtime" do
    patch :update, id: @vehicle_realtime, vehicle_realtime: { current_status: @vehicle_realtime.current_status, lat: @vehicle_realtime.lat, long: @vehicle_realtime.long, vehicle_route_id: @vehicle_realtime.vehicle_route_id, vehicle_stop_id: @vehicle_realtime.vehicle_stop_id, vehicle_trip_id: @vehicle_realtime.vehicle_trip_id }
    assert_redirected_to vehicle_realtime_path(assigns(:vehicle_realtime))
  end

  test "should destroy vehicle_realtime" do
    assert_difference('VehicleRealtime.count', -1) do
      delete :destroy, id: @vehicle_realtime
    end

    assert_redirected_to vehicle_realtimes_path
  end
end
