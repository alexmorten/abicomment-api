require 'test_helper'

class VoteOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote_option = vote_options(:one)
  end

  test "should get index" do
    get vote_options_url
    assert_response :success
  end

  test "should create vote_option" do
    assert_difference('VoteOption.count') do
      post vote_options_url, params: { vote_option: { poll_id: @vote_option.poll_id, title: @vote_option.title } }
    end

    assert_response 201
  end

  test "should show vote_option" do
    get vote_option_url(@vote_option)
    assert_response :success
  end

  test "should update vote_option" do
    patch vote_option_url(@vote_option), params: { vote_option: { poll_id: @vote_option.poll_id, title: @vote_option.title } }
    assert_response 200
  end

  test "should destroy vote_option" do
    assert_difference('VoteOption.count', -1) do
      delete vote_option_url(@vote_option)
    end

    assert_response 204
  end
end
