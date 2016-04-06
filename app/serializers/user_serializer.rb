class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age,:status
  has_many :comments
end
