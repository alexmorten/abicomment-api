class PollSerializer < ActiveModel::Serializer
  attributes :id, :topic, :voteamount
  has_many :options
end
