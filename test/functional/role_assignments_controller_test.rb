require 'test_helper'

class RoleAssignmentsControllerTest < ActionController::TestCase
  setup do
    @role_assignment = role_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_assignment" do
    assert_difference('RoleAssignment.count') do
      post :create, role_assignment: @role_assignment.attributes
    end

    assert_redirected_to role_assignment_path(assigns(:role_assignment))
  end

  test "should show role_assignment" do
    get :show, id: @role_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_assignment
    assert_response :success
  end

  test "should update role_assignment" do
    put :update, id: @role_assignment, role_assignment: @role_assignment.attributes
    assert_redirected_to role_assignment_path(assigns(:role_assignment))
  end

  test "should destroy role_assignment" do
    assert_difference('RoleAssignment.count', -1) do
      delete :destroy, id: @role_assignment
    end

    assert_redirected_to role_assignments_path
  end
end
