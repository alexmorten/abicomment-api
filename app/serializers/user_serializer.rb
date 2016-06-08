class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:forename, :age,:status
  has_many :comments



end
