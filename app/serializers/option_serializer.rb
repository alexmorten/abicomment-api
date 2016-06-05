class OptionSerializer < ActiveModel::Serializer
  attributes :id, :title, :voteamount
  belongs_to :poll
end
