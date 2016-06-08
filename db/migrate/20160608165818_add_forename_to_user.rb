class AddForenameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :forename, :string
  end
end
