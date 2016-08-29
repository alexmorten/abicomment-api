class CreateMottos < ActiveRecord::Migration[5.0]
  def change
    create_table :mottos do |t|
      t.references :user, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
