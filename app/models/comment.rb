class Comment < ApplicationRecord
  belongs_to :user, :inverse_of => :comments
  belongs_to :commentor , :class_name => "User" , :inverse_of => :comments_written , foreign_key: "commentor_id"
end
