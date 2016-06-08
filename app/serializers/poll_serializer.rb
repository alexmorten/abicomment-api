class PollSerializer < ActiveModel::Serializer
  attributes :id, :topic, :voteamount , :hasvoted
  has_many :options


def hasvoted
  true if scope.voted_for?(object)
end
end
