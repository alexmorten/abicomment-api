require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { cardnummer: @transaction.cardnummer, date: @transaction.date, excerpt: @transaction.excerpt, reason: @transaction.reason, receipt: @transaction.receipt, user_id: @transaction.user_id, value: @transaction.value } }
    end

    assert_response 201
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { cardnummer: @transaction.cardnummer, date: @transaction.date, excerpt: @transaction.excerpt, reason: @transaction.reason, receipt: @transaction.receipt, user_id: @transaction.user_id, value: @transaction.value } }
    assert_response 200
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_response 204
  end
end
