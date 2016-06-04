class PollSerializer < ActiveModel::Serializer
  attributes :id, :topic
  has_many :options
end
