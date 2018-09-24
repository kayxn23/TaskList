class AddCompletedAtToTodoItems < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :completed_at, :datetime
  end
end

# :tasks is my model here 
