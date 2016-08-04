class MottoSerializer < ActiveModel::Serializer
  attributes :id, :text, :hasupvoted , :upvotes
  belongs_to :user
  def hasupvoted
    scope.has_upvoted?(object)
  end
  def upvotes
    object.mottovotes.count
  end
end
