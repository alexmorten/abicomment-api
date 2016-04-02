class User < ApplicationRecord
  has_many :comments

  # notice this comes BEFORE the include statement below
  # also notice that :confirmable is not included in this block
  devise :database_authenticatable,
    :recoverable,
    :trackable,
    :validatable,
    :registerable
    # ,:omniauthable

  # note that this include statement comes AFTER the devise block above
  include DeviseTokenAuth::Concerns::User

   enum status: [ :normal, :moderator, :admin ]
end
