class OptionSerializer < ActiveModel::Serializer
  attributes :id, :title, :voteamount
  belongs_to :poll

  def voteamount()
    object.votes.count
  end
end
