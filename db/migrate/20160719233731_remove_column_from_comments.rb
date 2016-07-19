class RemoveColumnFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :email, :string
    remove_column :comments, :website, :string
  end
end
