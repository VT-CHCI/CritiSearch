require 'test_helper'

class RatingValuesControllerTest < ActionController::TestCase
  setup do
    @rating_value = rating_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_value" do
    assert_difference('RatingValue.count') do
      post :create, rating_value: @rating_value.attributes
    end

    assert_redirected_to rating_value_path(assigns(:rating_value))
  end

  test "should show rating_value" do
    get :show, id: @rating_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_value
    assert_response :success
  end

  test "should update rating_value" do
    put :update, id: @rating_value, rating_value: @rating_value.attributes
    assert_redirected_to rating_value_path(assigns(:rating_value))
  end

  test "should destroy rating_value" do
    assert_difference('RatingValue.count', -1) do
      delete :destroy, id: @rating_value
    end

    assert_redirected_to rating_values_path
  end
end
