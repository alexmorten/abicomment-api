class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :text, :quoted
  belongs_to :user
end
