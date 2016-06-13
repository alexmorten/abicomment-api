class CourseSerializer < ActiveModel::Serializer
  attributes :id, :teacher, :name, :isattending
  has_many :attendings
  has_many :anecdotes
  def isattending
    scope.is_attending?(object)
  end
end
