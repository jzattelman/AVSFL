require 'test_helper'

class PilotFitnessFilesControllerTest < ActionController::TestCase
  setup do
    @pilot_fitness_file = pilot_fitness_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pilot_fitness_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pilot_fitness_file" do
    assert_difference('PilotFitnessFile.count') do
      post :create, pilot_fitness_file: { q10: @pilot_fitness_file.q10, q11: @pilot_fitness_file.q11, q12: @pilot_fitness_file.q12, q13: @pilot_fitness_file.q13, q14: @pilot_fitness_file.q14, q1: @pilot_fitness_file.q1, q2: @pilot_fitness_file.q2, q3: @pilot_fitness_file.q3, q4: @pilot_fitness_file.q4, q5: @pilot_fitness_file.q5, q6: @pilot_fitness_file.q6, q7: @pilot_fitness_file.q7, q8: @pilot_fitness_file.q8, q9: @pilot_fitness_file.q9 }
    end

    assert_redirected_to pilot_fitness_file_path(assigns(:pilot_fitness_file))
  end

  test "should show pilot_fitness_file" do
    get :show, id: @pilot_fitness_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pilot_fitness_file
    assert_response :success
  end

  test "should update pilot_fitness_file" do
    put :update, id: @pilot_fitness_file, pilot_fitness_file: { q10: @pilot_fitness_file.q10, q11: @pilot_fitness_file.q11, q12: @pilot_fitness_file.q12, q13: @pilot_fitness_file.q13, q14: @pilot_fitness_file.q14, q1: @pilot_fitness_file.q1, q2: @pilot_fitness_file.q2, q3: @pilot_fitness_file.q3, q4: @pilot_fitness_file.q4, q5: @pilot_fitness_file.q5, q6: @pilot_fitness_file.q6, q7: @pilot_fitness_file.q7, q8: @pilot_fitness_file.q8, q9: @pilot_fitness_file.q9 }
    assert_redirected_to pilot_fitness_file_path(assigns(:pilot_fitness_file))
  end

  test "should destroy pilot_fitness_file" do
    assert_difference('PilotFitnessFile.count', -1) do
      delete :destroy, id: @pilot_fitness_file
    end

    assert_redirected_to pilot_fitness_files_path
  end
end
