require 'test_helper'

class PromtableentriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promtableentry = promtableentries(:one)
  end

  test "should get index" do
    get promtableentries_url
    assert_response :success
  end

  test "should create promtableentry" do
    assert_difference('Promtableentry.count') do
      post promtableentries_url, params: { promtableentry: { promtable_id: @promtableentry.promtable_id, seats: @promtableentry.seats, user_id: @promtableentry.user_id } }
    end

    assert_response 201
  end

  test "should show promtableentry" do
    get promtableentry_url(@promtableentry)
    assert_response :success
  end

  test "should update promtableentry" do
    patch promtableentry_url(@promtableentry), params: { promtableentry: { promtable_id: @promtableentry.promtable_id, seats: @promtableentry.seats, user_id: @promtableentry.user_id } }
    assert_response 200
  end

  test "should destroy promtableentry" do
    assert_difference('Promtableentry.count', -1) do
      delete promtableentry_url(@promtableentry)
    end

    assert_response 204
  end
end
