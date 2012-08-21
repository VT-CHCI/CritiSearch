require 'test_helper'

class SectionAssignmentsControllerTest < ActionController::TestCase
  setup do
    @section_assignment = section_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:section_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section_assignment" do
    assert_difference('SectionAssignment.count') do
      post :create, section_assignment: @section_assignment.attributes
    end

    assert_redirected_to section_assignment_path(assigns(:section_assignment))
  end

  test "should show section_assignment" do
    get :show, id: @section_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section_assignment
    assert_response :success
  end

  test "should update section_assignment" do
    put :update, id: @section_assignment, section_assignment: @section_assignment.attributes
    assert_redirected_to section_assignment_path(assigns(:section_assignment))
  end

  test "should destroy section_assignment" do
    assert_difference('SectionAssignment.count', -1) do
      delete :destroy, id: @section_assignment
    end

    assert_redirected_to section_assignments_path
  end
end
