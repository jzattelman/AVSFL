require 'test_helper'

class IncidentsControllerTest < ActionController::TestCase
  setup do
    @incident = incidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident" do
    assert_difference('Incident.count') do
      post :create, incident: { action_taken: @incident.action_taken, atrb_notified: @incident.atrb_notified, casa_notified: @incident.casa_notified, chief_pilot_notified: @incident.chief_pilot_notified, consequences: @incident.consequences, description: @incident.description, equipment_damage: @incident.equipment_damage, incident_time: @incident.incident_time, insurance_notified: @incident.insurance_notified, management_notified: @incident.management_notified, personal_injury: @incident.personal_injury, report_date: @incident.report_date, reporter_name: @incident.reporter_name, thirdparty_damage: @incident.thirdparty_damage, witness_names: @incident.witness_names, worksafe_notified: @incident.worksafe_notified }
    end

    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should show incident" do
    get :show, id: @incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident
    assert_response :success
  end

  test "should update incident" do
    put :update, id: @incident, incident: { action_taken: @incident.action_taken, atrb_notified: @incident.atrb_notified, casa_notified: @incident.casa_notified, chief_pilot_notified: @incident.chief_pilot_notified, consequences: @incident.consequences, description: @incident.description, equipment_damage: @incident.equipment_damage, incident_time: @incident.incident_time, insurance_notified: @incident.insurance_notified, management_notified: @incident.management_notified, personal_injury: @incident.personal_injury, report_date: @incident.report_date, reporter_name: @incident.reporter_name, thirdparty_damage: @incident.thirdparty_damage, witness_names: @incident.witness_names, worksafe_notified: @incident.worksafe_notified }
    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should destroy incident" do
    assert_difference('Incident.count', -1) do
      delete :destroy, id: @incident
    end

    assert_redirected_to incidents_path
  end
end
