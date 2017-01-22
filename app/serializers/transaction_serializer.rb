class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :reason, :receipt, :excerpt, :cardnumber, :value, :date, :balance

  def balance
    Transaction.where("date <= ?",object.date).sum(:value).to_f
  end
end
