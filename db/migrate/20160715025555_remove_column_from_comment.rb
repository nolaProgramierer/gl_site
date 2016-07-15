class RemoveColumnFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :ancestry, :string
  end
end
