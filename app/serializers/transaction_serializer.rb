class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :reason, :receipt, :excerpt, :cardnumber, :value, :date, :balance
  belongs_to :user
  def balance
  Transaction.where("DATE(date) < ? OR (DATE(date) = ? AND value <= ?)",object.date,object.date,object.value).sum(:value).to_f
  end
end
