require 'test_helper'

class MottovotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mottovote = mottovotes(:one)
  end

  test "should get index" do
    get mottovotes_url
    assert_response :success
  end

  test "should create mottovote" do
    assert_difference('Mottovote.count') do
      post mottovotes_url, params: { mottovote: { motto_id: @mottovote.motto_id, note: @mottovote.note, user_id: @mottovote.user_id } }
    end

    assert_response 201
  end

  test "should show mottovote" do
    get mottovote_url(@mottovote)
    assert_response :success
  end

  test "should update mottovote" do
    patch mottovote_url(@mottovote), params: { mottovote: { motto_id: @mottovote.motto_id, note: @mottovote.note, user_id: @mottovote.user_id } }
    assert_response 200
  end

  test "should destroy mottovote" do
    assert_difference('Mottovote.count', -1) do
      delete mottovote_url(@mottovote)
    end

    assert_response 204
  end
end
