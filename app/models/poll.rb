class Poll < ApplicationRecord

  has_many :options, dependent: :destroy
  validates :topic, presence: true
end
