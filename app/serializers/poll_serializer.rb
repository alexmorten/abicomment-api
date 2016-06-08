class PollSerializer < ActiveModel::Serializer
  attributes :id, :topic, :voteamount , :hasvoted
  has_many :options


def hasvoted
   if scope.voted_for?(object)
     return true
   else
     return false;
   end
end
end
