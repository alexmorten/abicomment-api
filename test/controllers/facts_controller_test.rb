require 'test_helper'

class FactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fact = facts(:one)
  end

  test "should get index" do
    get facts_url
    assert_response :success
  end

  test "should create fact" do
    assert_difference('Fact.count') do
      post facts_url, params: { fact: { text: @fact.text, user_id: @fact.user_id } }
    end

    assert_response 201
  end

  test "should show fact" do
    get fact_url(@fact)
    assert_response :success
  end

  test "should update fact" do
    patch fact_url(@fact), params: { fact: { text: @fact.text, user_id: @fact.user_id } }
    assert_response 200
  end

  test "should destroy fact" do
    assert_difference('Fact.count', -1) do
      delete fact_url(@fact)
    end

    assert_response 204
  end
end
