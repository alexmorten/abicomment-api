class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:forename,:fullname,:status,:currentsigninat,:currentsigninip
  def fullname
    object.forename+" "+object.name
  end
  def currentsigninat
    object.current_sign_in_at
  end
  def currentsigninip
    object.current_sign_in_ip
  end
end
