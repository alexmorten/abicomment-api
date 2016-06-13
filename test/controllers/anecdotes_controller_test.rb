require 'test_helper'

class AnecdotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anecdote = anecdotes(:one)
  end

  test "should get index" do
    get anecdotes_url
    assert_response :success
  end

  test "should create anecdote" do
    assert_difference('Anecdote.count') do
      post anecdotes_url, params: { anecdote: { course_id: @anecdote.course_id, text: @anecdote.text, user_id: @anecdote.user_id } }
    end

    assert_response 201
  end

  test "should show anecdote" do
    get anecdote_url(@anecdote)
    assert_response :success
  end

  test "should update anecdote" do
    patch anecdote_url(@anecdote), params: { anecdote: { course_id: @anecdote.course_id, text: @anecdote.text, user_id: @anecdote.user_id } }
    assert_response 200
  end

  test "should destroy anecdote" do
    assert_difference('Anecdote.count', -1) do
      delete anecdote_url(@anecdote)
    end

    assert_response 204
  end
end
