class MakeCompletedBoolean < ActiveRecord::Migration
  def up
    remove_column :todos, :completed, :string
    add_column :todos, :completed, :boolean
  end

  def down
    add_column :todos, :completed, :string
    remove_column :todos, :completed, :boolean
  end
end
