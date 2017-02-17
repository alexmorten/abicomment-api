class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /transactions
  def index
    if @current_user.status=="admin" || @current_user.status == "trusted"
      @transactions = Transaction.order(date: :asc,value: :asc)

      render json: @transactions ,meta: {total: @transactions.sum(:value).to_f}
    end
  end

  # GET /transactions/1
  def show
    if @current_user.status=="admin" || @current_user.status == "trusted"
        render json: @transactions
    end
  end

  # POST /transactions
  def create
    if @current_user.status=="admin" || @current_user.status == "trusted"
      @transaction = Transaction.new(transaction_params)
      @transaction.user = @current_user
      if @transaction.save
        render json: @transaction, status: :created, location: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @current_user.status=="admin" || @current_user.status == "trusted"
      if @transaction.update(transaction_params)
        render json: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /transactions/1
  def destroy
    if @current_user.status=="admin" || @current_user.status == "trusted"
      @transaction.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:user_id, :reason, :receipt, :excerpt, :cardnummer, :value, :date)
    end
end
