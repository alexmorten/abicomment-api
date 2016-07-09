require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log = logs(:one)
  end

  test "should get index" do
    get logs_url
    assert_response :success
  end

  test "should create log" do
    assert_difference('Log.count') do
      post logs_url, params: { log: { text: @log.text, user_id: @log.user_id } }
    end

    assert_response 201
  end

  test "should show log" do
    get log_url(@log)
    assert_response :success
  end

  test "should update log" do
    patch log_url(@log), params: { log: { text: @log.text, user_id: @log.user_id } }
    assert_response 200
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete log_url(@log)
    end

    assert_response 204
  end
end
