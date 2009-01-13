require 'test_helper'

class ThreadStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thread_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thread_status" do
    assert_difference('ThreadStatus.count') do
      post :create, :thread_status => { }
    end

    assert_redirected_to thread_status_path(assigns(:thread_status))
  end

  test "should show thread_status" do
    get :show, :id => thread_statuses(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => thread_statuses(:one).id
    assert_response :success
  end

  test "should update thread_status" do
    put :update, :id => thread_statuses(:one).id, :thread_status => { }
    assert_redirected_to thread_status_path(assigns(:thread_status))
  end

  test "should destroy thread_status" do
    assert_difference('ThreadStatus.count', -1) do
      delete :destroy, :id => thread_statuses(:one).id
    end

    assert_redirected_to thread_statuses_path
  end
end
