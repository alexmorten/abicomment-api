class User < ApplicationRecord
  has_many :comments, dependent: :destroy , :inverse_of => :user
  has_many :comments_written , :class_name => "Comment", :inverse_of => :commentor,foreign_key: "commentor_id"

  has_many :quotes

  has_many :polls

  has_many :votes, dependent: :destroy
  has_many :options, through: :votes

  has_many :courses_created, :class_name => "Course",:inverse_of => :creator

  has_many :attendings
  has_many :courses, through: :attendings
  has_many :anecdotes

  has_many :logs

  has_many :facts

  has_many :mottovotes
  has_many :mottos, through: :mottovotes

  has_many :transactions

  has_many :favorites
  has_many :favorited , :class_name => "Favorite" , :inverse_of => :favoritee
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

   enum status: [ :normal, :moderator, :admin , :trusted]


   def voted_for?(poll)
     options.where(poll_id: poll.id).any?
   end
   def has_upvoted?(motto)
     mottovotes.where(motto_id: motto.id).any?
   end
   def is_attending?(course)
     attendings.where(course_id: course.id).any?
   end
   def has_favorited?(user)
     favorites.where(favoritee_id: user.id).any?
   end
  def delete_any_vote_for(poll)
    votes.each {|v|
      if v.option.poll==poll
        v.destroy()
      end
    }
  end
end
