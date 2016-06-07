class Option < ApplicationRecord
  def voteamount()
    votes.count
  end
  belongs_to :poll
  validates :title, presence: true
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
end