class RemoveColumnFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :ancestry, :string
    remove_index :comments, :ancestry
  end
end
