class Poll < ApplicationRecord
  def voteamount()
    c=0
    options.each {|o| c += o.votes.count}
    return c
  end
  has_many :options, dependent: :destroy
  validates :topic, presence: true
end
