class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :reason, :receipt, :excerpt, :cardnumber, :value, :date, :balance
  has_one :user
  def balance
    Transaction.where("id <= ?",object.id).sum(:value).to_f
  end
end
