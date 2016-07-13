class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :parent_id, :integer
  end
end
