class PromtableSerializer < ActiveModel::Serializer
  attributes :id, :seats, :free , :taken, :entryallowed
  belongs_to :user
  has_many :promtableentries
  has_many :users
  def entryallowed
    object.may_create_entry?(instance_options[:current_user])
  end
end
