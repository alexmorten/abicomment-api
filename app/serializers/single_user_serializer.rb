class SingleUserSerializer < ActiveModel::Serializer
  attributes :id, :name,:forename,:status
  has_many :comments
  has_many :attendings

end
