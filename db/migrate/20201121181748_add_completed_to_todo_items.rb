class AddCompletedToTodoItems < ActiveRecord::Migration[6.0]
  def change
    add_column :todo_items, :complete, :boolean, default: false
  end
end
