require 'test_helper'

class UsersFavoriteRoutesControllerTest < ActionController::TestCase
  setup do
    @users_favorite_route = users_favorite_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_favorite_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_favorite_route" do
    assert_difference('UsersFavoriteRoute.count') do
      post :create, users_favorite_route: { user_id: @users_favorite_route.user_id, vehicle_route_id: @users_favorite_route.vehicle_route_id }
    end

    assert_redirected_to users_favorite_route_path(assigns(:users_favorite_route))
  end

  test "should show users_favorite_route" do
    get :show, id: @users_favorite_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_favorite_route
    assert_response :success
  end

  test "should update users_favorite_route" do
    patch :update, id: @users_favorite_route, users_favorite_route: { user_id: @users_favorite_route.user_id, vehicle_route_id: @users_favorite_route.vehicle_route_id }
    assert_redirected_to users_favorite_route_path(assigns(:users_favorite_route))
  end

  test "should destroy users_favorite_route" do
    assert_difference('UsersFavoriteRoute.count', -1) do
      delete :destroy, id: @users_favorite_route
    end

    assert_redirected_to users_favorite_routes_path
  end
end
