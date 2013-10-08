require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @session = sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    assert_difference('Session.count') do
      post :create, session: { chief_pilot_id: @session.chief_pilot_id, client: @session.client, date: @session.date, gcs_control: @session.gcs_control, gcs_deployment: @session.gcs_deployment, jsa_time: @session.jsa_time, location: @session.location, mission_briefing_time: @session.mission_briefing_time, observer: @session.observer, payload: @session.payload, pre_flight_time: @session.pre_flight_time, remote_pilot_id: @session.remote_pilot_id, task: @session.task, weather: @session.weather, windspeed: @session.windspeed }
    end

    assert_redirected_to session_path(assigns(:session))
  end

  test "should show session" do
    get :show, id: @session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session
    assert_response :success
  end

  test "should update session" do
    put :update, id: @session, session: { chief_pilot_id: @session.chief_pilot_id, client: @session.client, date: @session.date, gcs_control: @session.gcs_control, gcs_deployment: @session.gcs_deployment, jsa_time: @session.jsa_time, location: @session.location, mission_briefing_time: @session.mission_briefing_time, observer: @session.observer, payload: @session.payload, pre_flight_time: @session.pre_flight_time, remote_pilot_id: @session.remote_pilot_id, task: @session.task, weather: @session.weather, windspeed: @session.windspeed }
    assert_redirected_to session_path(assigns(:session))
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete :destroy, id: @session
    end

    assert_redirected_to sessions_path
  end
end
