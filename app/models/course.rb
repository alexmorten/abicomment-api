class Course < ApplicationRecord
  belongs_to :creator, :class_name => "User", :inverse_of => :courses_created
  has_many :attendings, dependent: :destroy
  has_many :users, through: :attendings
  has_many :anecdotes, dependent: :destroy
end
