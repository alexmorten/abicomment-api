class PromtableentrySerializer < ActiveModel::Serializer
  attributes :id, :seats
  belongs_to :promtable
  belongs_to :user
end
