require 'test_helper'

class AttendingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attending = attendings(:one)
  end

  test "should get index" do
    get attendings_url
    assert_response :success
  end

  test "should create attending" do
    assert_difference('Attending.count') do
      post attendings_url, params: { attending: { course_id: @attending.course_id, note: @attending.note, user_id: @attending.user_id } }
    end

    assert_response 201
  end

  test "should show attending" do
    get attending_url(@attending)
    assert_response :success
  end

  test "should update attending" do
    patch attending_url(@attending), params: { attending: { course_id: @attending.course_id, note: @attending.note, user_id: @attending.user_id } }
    assert_response 200
  end

  test "should destroy attending" do
    assert_difference('Attending.count', -1) do
      delete attending_url(@attending)
    end

    assert_response 204
  end
end
