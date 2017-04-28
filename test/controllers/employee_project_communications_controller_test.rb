require 'test_helper'

class EmployeeProjectCommunicationsControllerTest < ActionController::TestCase
  setup do
    @employee_project_communication = employee_project_communications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_project_communications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_project_communication" do
    assert_difference('EmployeeProjectCommunication.count') do
      post :create, employee_project_communication: { employee_id: @employee_project_communication.employee_id, project_id: @employee_project_communication.project_id }
    end

    assert_redirected_to employee_project_communication_path(assigns(:employee_project_communication))
  end

  test "should show employee_project_communication" do
    get :show, id: @employee_project_communication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_project_communication
    assert_response :success
  end

  test "should update employee_project_communication" do
    patch :update, id: @employee_project_communication, employee_project_communication: { employee_id: @employee_project_communication.employee_id, project_id: @employee_project_communication.project_id }
    assert_redirected_to employee_project_communication_path(assigns(:employee_project_communication))
  end

  test "should destroy employee_project_communication" do
    assert_difference('EmployeeProjectCommunication.count', -1) do
      delete :destroy, id: @employee_project_communication
    end

    assert_redirected_to employee_project_communications_path
  end
end
