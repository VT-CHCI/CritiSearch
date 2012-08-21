require 'test_helper'

class AdminAssignmentsControllerTest < ActionController::TestCase
  setup do
    @admin_assignment = admin_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_assignment" do
    assert_difference('AdminAssignment.count') do
      post :create, admin_assignment: @admin_assignment.attributes
    end

    assert_redirected_to admin_assignment_path(assigns(:admin_assignment))
  end

  test "should show admin_assignment" do
    get :show, id: @admin_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_assignment
    assert_response :success
  end

  test "should update admin_assignment" do
    put :update, id: @admin_assignment, admin_assignment: @admin_assignment.attributes
    assert_redirected_to admin_assignment_path(assigns(:admin_assignment))
  end

  test "should destroy admin_assignment" do
    assert_difference('AdminAssignment.count', -1) do
      delete :destroy, id: @admin_assignment
    end

    assert_redirected_to admin_assignments_path
  end
end
