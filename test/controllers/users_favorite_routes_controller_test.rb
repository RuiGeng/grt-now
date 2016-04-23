require 'test_helper'

class UsersFavoriteRoutesControllerTest < ActionController::TestCase
  setup do
    @user_favorite_route = user_favorite_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_favorite_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_favorite_route" do
    assert_difference('UsersFavoriteRoute.count') do
      post :create, user_favorite_route: { user_id: @user_favorite_route.user_id, vehicle_route_id: @user_favorite_route.vehicle_route_id }
    end

    assert_redirected_to user_favorite_route_path(assigns(:user_favorite_route))
  end

  test "should show user_favorite_route" do
    get :show, id: @user_favorite_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_favorite_route
    assert_response :success
  end

  test "should update user_favorite_route" do
    patch :update, id: @user_favorite_route, user_favorite_route: { user_id: @user_favorite_route.user_id, vehicle_route_id: @user_favorite_route.vehicle_route_id }
    assert_redirected_to user_favorite_route_path(assigns(:user_favorite_route))
  end

  test "should destroy user_favorite_route" do
    assert_difference('UsersFavoriteRoute.count', -1) do
      delete :destroy, id: @user_favorite_route
    end

    assert_redirected_to user_favorite_routes_path
  end
end
