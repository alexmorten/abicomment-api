class AddTypeToLog < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :kind, :string
    add_column :logs, :catagory, :string
  end
end
