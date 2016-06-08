class PollSerializer < ActiveModel::Serializer
  attributes :id, :topic , :hasvoted
  has_many :options


def hasvoted
  scope.voted_for?(object)
end
end
