class CreatePromtables < ActiveRecord::Migration[5.0]
  def change
    create_table :promtables do |t|
      t.references :user, foreign_key: true
      t.integer :seats

      t.timestamps
    end
  end
end
