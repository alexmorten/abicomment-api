class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:forename,:fullname,:status
  def fullname
    object.forename+" "+object.name
  end
end
