require 'test_helper'

class BatterychargesControllerTest < ActionController::TestCase
  setup do
    @batterycharge = batterycharges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:batterycharges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create batterycharge" do
    assert_difference('Batterycharge.count') do
      post :create, batterycharge: { date: @batterycharge.date, end_percentage: @batterycharge.end_percentage, end_voltage: @batterycharge.end_voltage, start_voltage_decimal: @batterycharge.start_voltage_decimal, status: @batterycharge.status }
    end

    assert_redirected_to batterycharge_path(assigns(:batterycharge))
  end

  test "should show batterycharge" do
    get :show, id: @batterycharge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @batterycharge
    assert_response :success
  end

  test "should update batterycharge" do
    put :update, id: @batterycharge, batterycharge: { date: @batterycharge.date, end_percentage: @batterycharge.end_percentage, end_voltage: @batterycharge.end_voltage, start_voltage_decimal: @batterycharge.start_voltage_decimal, status: @batterycharge.status }
    assert_redirected_to batterycharge_path(assigns(:batterycharge))
  end

  test "should destroy batterycharge" do
    assert_difference('Batterycharge.count', -1) do
      delete :destroy, id: @batterycharge
    end

    assert_redirected_to batterycharges_path
  end
end
