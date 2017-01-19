class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :reason, :receipt, :excerpt, :cardnumber, :value, :date, :balance
  
  def balance
    Transaction.where("id <= ?",object.id).sum(:value).to_f
  end
end
