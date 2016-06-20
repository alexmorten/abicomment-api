class SingleUserSerializer < ActiveModel::Serializer
  attributes :id, :name,:forename,:fullname,:status
  has_many :ordered_limited_comments, key: :comments
  has_many :attendings
  def ordered_limited_comments
    limit = instance_options[:comment_limit] || 20
  return  object.comments.order(created_at: :desc).limit(limit)
  end

  def fullname
    object.forename+" "+object.name
  end
end
