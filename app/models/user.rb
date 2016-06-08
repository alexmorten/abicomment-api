class User < ApplicationRecord
  has_many :comments, dependent: :destroy , :inverse_of => :user
  has_many :comments_written , :class_name => "Comment", :inverse_of => :commentor,foreign_key: "commentor_id"
  has_many :quotes
  has_many :votes, dependent: :destroy
  has_many :options, through: :votes
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


   def voted_for?(poll)
     options.where(poll_id: poll.id).any?
   end
  def delete_any_vote_for(poll)
    votes.each {|v|
      if v.option.poll==poll
        v.destroy()
      end
    }
  end
end
