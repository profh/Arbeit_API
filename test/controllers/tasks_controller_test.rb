require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { completed: @task.completed, completed_by: @task.completed_by, created_by: @task.created_by, due_on: @task.due_on, due_string: @task.due_string, name: @task.name, priority: @task.priority, project_id: @task.project_id }
    end

    assert_response 201
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should update task" do
    put :update, id: @task, task: { completed: @task.completed, completed_by: @task.completed_by, created_by: @task.created_by, due_on: @task.due_on, due_string: @task.due_string, name: @task.name, priority: @task.priority, project_id: @task.project_id }
    assert_response 204
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_response 204
  end
end
