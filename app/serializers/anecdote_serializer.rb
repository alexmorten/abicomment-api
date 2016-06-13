class AnecdoteSerializer < ActiveModel::Serializer
  attributes :id, :text
  belongs_to :user
  belongs_to :course
end
