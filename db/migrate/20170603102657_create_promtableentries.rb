class CreatePromtableentries < ActiveRecord::Migration[5.0]
  def change
    create_table :promtableentries do |t|
      t.references :promtable, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :seats

      t.timestamps
    end
  end
end
