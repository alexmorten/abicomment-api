class AttendingSerializer < ActiveModel::Serializer
  attributes :id, :note
  belongs_to :course
  belongs_to :user
end
