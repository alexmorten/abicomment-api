class OptionSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :poll
end
