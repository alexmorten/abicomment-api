class Mottovote < ApplicationRecord
  belongs_to :user
  belongs_to :motto
end
