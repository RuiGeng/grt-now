require 'test_helper'

class VehicleTripsControllerTest < ActionController::TestCase
  setup do
    @vehicle_trip = vehicle_trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_trip" do
    assert_difference('VehicleTrip.count') do
      post :create, vehicle_trip: { direction: @vehicle_trip.direction, name: @vehicle_trip.name, service: @vehicle_trip.service, vehicle_route_id: @vehicle_trip.vehicle_route_id }
    end

    assert_redirected_to vehicle_trip_path(assigns(:vehicle_trip))
  end

  test "should show vehicle_trip" do
    get :show, id: @vehicle_trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle_trip
    assert_response :success
  end

  test "should update vehicle_trip" do
    patch :update, id: @vehicle_trip, vehicle_trip: { direction: @vehicle_trip.direction, name: @vehicle_trip.name, service: @vehicle_trip.service, vehicle_route_id: @vehicle_trip.vehicle_route_id }
    assert_redirected_to vehicle_trip_path(assigns(:vehicle_trip))
  end

  test "should destroy vehicle_trip" do
    assert_difference('VehicleTrip.count', -1) do
      delete :destroy, id: @vehicle_trip
    end

    assert_redirected_to vehicle_trips_path
  end
end
