class Motto < ApplicationRecord
  belongs_to :user
  has_many :mottovotes, dependent: :destroy
  has_many :users, through: :mottovotes
end
