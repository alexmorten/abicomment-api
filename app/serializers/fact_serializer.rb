class FactSerializer < ActiveModel::Serializer
  attributes :id, :text
  belongs_to :user
end
