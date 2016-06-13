class CourseSerializer < ActiveModel::Serializer
  attributes :id, :teacher, :name
  has_many :attendings
  
end
