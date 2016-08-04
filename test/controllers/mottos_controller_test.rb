require 'test_helper'

class MottosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motto = mottos(:one)
  end

  test "should get index" do
    get mottos_url
    assert_response :success
  end

  test "should create motto" do
    assert_difference('Motto.count') do
      post mottos_url, params: { motto: { text: @motto.text, user_id: @motto.user_id } }
    end

    assert_response 201
  end

  test "should show motto" do
    get motto_url(@motto)
    assert_response :success
  end

  test "should update motto" do
    patch motto_url(@motto), params: { motto: { text: @motto.text, user_id: @motto.user_id } }
    assert_response 200
  end

  test "should destroy motto" do
    assert_difference('Motto.count', -1) do
      delete motto_url(@motto)
    end

    assert_response 204
  end
end
