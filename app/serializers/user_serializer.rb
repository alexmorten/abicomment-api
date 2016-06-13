class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:forename, :age,:status
  has_many :ordered_comments ,key:"comments"
  has_many :attendings
  def ordered_comments
    object.comments.order(created_at: :desc)
  end
end
