class CreateFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :facts do |t|
      t.references :user, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
