class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:forename,:fullname,:status,:currentsigninat,:currentsigninip,:signincount
  def fullname
    object.forename+" "+object.name
  end
  def currentsigninat
    object.updated_at
  end
  def currentsigninip
    object.current_sign_in_ip
  end
  def signincount
    object.sign_in_count
  end
end
