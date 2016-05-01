class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age,:status
  has_many :comments
  has_many :comments_written
  has_many :quotes
end
