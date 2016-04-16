require 'test_helper'

class VehicleRoutesControllerTest < ActionController::TestCase
  setup do
    @vehicle_route = vehicle_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_route" do
    assert_difference('VehicleRoute.count') do
      post :create, vehicle_route: { long_name: @vehicle_route.long_name }
    end

    assert_redirected_to vehicle_route_path(assigns(:vehicle_route))
  end

  test "should show vehicle_route" do
    get :show, id: @vehicle_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle_route
    assert_response :success
  end

  test "should update vehicle_route" do
    patch :update, id: @vehicle_route, vehicle_route: { long_name: @vehicle_route.long_name }
    assert_redirected_to vehicle_route_path(assigns(:vehicle_route))
  end

  test "should destroy vehicle_route" do
    assert_difference('VehicleRoute.count', -1) do
      delete :destroy, id: @vehicle_route
    end

    assert_redirected_to vehicle_routes_path
  end
end
