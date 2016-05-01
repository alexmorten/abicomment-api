class AddCommentorToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :commentor_id , :integer 
  end
end
