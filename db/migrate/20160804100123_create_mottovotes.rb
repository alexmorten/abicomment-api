class CreateMottovotes < ActiveRecord::Migration[5.0]
  def change
    create_table :mottovotes do |t|
      t.references :user, foreign_key: true
      t.references :motto, foreign_key: true
      t.text :note

      t.timestamps
    end
    add_index :mottovotes, [:user_id, :motto_id], unique: true
  end
end
