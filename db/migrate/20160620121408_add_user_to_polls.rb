class AddUserToPolls < ActiveRecord::Migration[5.0]
  def change
    add_reference :polls, :user, foreign_key: true
  end
end
