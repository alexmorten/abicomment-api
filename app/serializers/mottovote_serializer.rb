class MottovoteSerializer < ActiveModel::Serializer
  attributes :id, :note
  belongs_to :user
  belongs_to :motto
end
