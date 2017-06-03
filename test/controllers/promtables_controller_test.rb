require 'test_helper'

class PromtablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promtable = promtables(:one)
  end

  test "should get index" do
    get promtables_url
    assert_response :success
  end

  test "should create promtable" do
    assert_difference('Promtable.count') do
      post promtables_url, params: { promtable: { seats: @promtable.seats, user_id: @promtable.user_id } }
    end

    assert_response 201
  end

  test "should show promtable" do
    get promtable_url(@promtable)
    assert_response :success
  end

  test "should update promtable" do
    patch promtable_url(@promtable), params: { promtable: { seats: @promtable.seats, user_id: @promtable.user_id } }
    assert_response 200
  end

  test "should destroy promtable" do
    assert_difference('Promtable.count', -1) do
      delete promtable_url(@promtable)
    end

    assert_response 204
  end
end
