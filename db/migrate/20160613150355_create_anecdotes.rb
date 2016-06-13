class CreateAnecdotes < ActiveRecord::Migration[5.0]
  def change
    create_table :anecdotes do |t|
      t.text :text
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
