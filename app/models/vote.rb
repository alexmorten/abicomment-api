class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :option
  has_one :poll, through: :option
end
