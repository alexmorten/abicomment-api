class SingleUserSerializer < ActiveModel::Serializer
  attributes :id, :name,:forename,:fullname,:status
  has_many :comments
  has_many :attendings

  def fullname
    object.forename+" "+object.name
  end
end
