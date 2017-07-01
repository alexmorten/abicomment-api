class Promtable < ApplicationRecord
  belongs_to :user
  has_many :promtableentries, dependent: :destroy
  has_many :users,through: :promtableentries
  def taken
    promtableentries.sum(:seats)
  end
  def free
    seats-taken
  end
  def may_create_entry?(user)
    user.promtableentry == nil
  end
end
