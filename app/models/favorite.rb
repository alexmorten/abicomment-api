class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favoritee, :class_name => "User" , :inverse_of => :favorited , foreign_key: "favoritee_id"
end
