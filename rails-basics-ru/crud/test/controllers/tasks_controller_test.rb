require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:first)
  end

  test 'should index tasks' do
    get tasks_url

    assert_response :success
    assert_match @task.name, @response.body
  end

  test 'should show task' do
    get task_url(@task)

    assert_response :success
    assert_match @task.name, @response.body
  end

  test 'should new task' do
    get new_task_url

    assert_response :success
  end

  test 'should edit task' do
    get edit_task_url(@task)

    assert_response :success
  end

  test 'should create task' do
    new_task_data = {
      name: 'Test',
      status: 'Started',
      creator: 'Test',
      completed: false
    }

    assert_difference('Task.count', +1) do
      post tasks_url, params: { task: new_task_data }
    end

    assert_redirected_to tasks_url
    assert_equal 'New task was created', flash[:success]
  end

  test 'should not create task without name' do
    new_task_data = {
      status: 'Started',
      creator: 'Test',
      completed: false
    }

    assert_no_difference 'Task.count', +1 do
      post tasks_url, params: { task: new_task_data }
    end

    assert_equal 'Task can not be created', flash[:failure]
  end

  test 'should update task' do
    patch task_url(@task), params: { task: {name: 'New name'} }

    assert_redirected_to task_url(@task)

    @task.reload
    assert_equal @task.name, 'New name'
    assert_equal 'Task was updated', flash[:success]
  end

  test 'should delete task' do
    assert_difference 'Task.count', -1 do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
    assert_equal 'Task was deleted', flash[:success]
  end
end
