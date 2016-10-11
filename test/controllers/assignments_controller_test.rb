require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  setup do
    @assignment = assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post :create, assignment: { active: @assignment.active, project_id: @assignment.project_id, user_id: @assignment.user_id }
    end

    assert_response 201
  end

  test "should show assignment" do
    get :show, id: @assignment
    assert_response :success
  end

  test "should update assignment" do
    put :update, id: @assignment, assignment: { active: @assignment.active, project_id: @assignment.project_id, user_id: @assignment.user_id }
    assert_response 204
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete :destroy, id: @assignment
    end

    assert_response 204
  end
end
