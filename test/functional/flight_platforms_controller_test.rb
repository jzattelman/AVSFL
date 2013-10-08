require 'test_helper'

class FlightPlatformsControllerTest < ActionController::TestCase
  setup do
    @flight_platform = flight_platforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flight_platforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight_platform" do
    assert_difference('FlightPlatform.count') do
      post :create, flight_platform: { id: @flight_platform.id, name: @flight_platform.name }
    end

    assert_redirected_to flight_platform_path(assigns(:flight_platform))
  end

  test "should show flight_platform" do
    get :show, id: @flight_platform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight_platform
    assert_response :success
  end

  test "should update flight_platform" do
    put :update, id: @flight_platform, flight_platform: { id: @flight_platform.id, name: @flight_platform.name }
    assert_redirected_to flight_platform_path(assigns(:flight_platform))
  end

  test "should destroy flight_platform" do
    assert_difference('FlightPlatform.count', -1) do
      delete :destroy, id: @flight_platform
    end

    assert_redirected_to flight_platforms_path
  end
end
