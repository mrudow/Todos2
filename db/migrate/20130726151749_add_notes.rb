class AddNotes < ActiveRecord::Migration
  def up
    add_column :todos, :notes, :text
  end

  def down
    drop_column :todos, :notes, :text
  end
end

