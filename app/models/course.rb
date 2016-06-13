class Course < ApplicationRecord
  has_many :attendings, dependent: :destroy
  has_many :users, through: :attendings
  has_many :anecdotes, dependent: :destroy
end
