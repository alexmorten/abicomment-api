class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.text :reason
      t.decimal :receipt
      t.decimal :excerpt
      t.decimal :cardnumber
      t.decimal :value
      t.date :date

      t.timestamps
    end
  end
end
