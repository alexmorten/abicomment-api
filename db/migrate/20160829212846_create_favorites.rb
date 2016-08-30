class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :favoritee_id

      t.timestamps
    end
    add_index(:favorites, [:user_id, :favoritee_id], :unique => true)
    add_index(:favorites, [:favoritee_id, :user_id], :unique => true)
  end
end
