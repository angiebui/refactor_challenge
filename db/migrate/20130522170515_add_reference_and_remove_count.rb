class AddReferenceAndRemoveCount < ActiveRecord::Migration
  def up
    remove_column :todos, :todo_count
    add_column :todos, :list_id, :integer
  end

  def down
    add_column :todos, :todo_count, :integer
    remove_column :todos, :list_id
  end
end
