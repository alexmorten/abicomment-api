class PollSerializer < ActiveModel::Serializer
  attributes :id, :topic , :hasvoted
  has_many :necessary_options, key:"options"
  def necessary_options
    if hasvoted
    object.options.select("options.*").joins(:votes).group("options.id").having("count(votes.id) > ?", 0)
  else
    object.options
  end
  end

def hasvoted
  scope.voted_for?(object)
end
end
