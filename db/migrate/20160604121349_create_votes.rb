class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
    add_index :votes, [:option_id, :user_id], unique: true

  end
end
