class RemoveListnameFromTodos < ActiveRecord::Migration
  def up
    remove_column :todos, :list_name 
  end

  def down
    add_column :todos, :list_name, :string
  end
end
