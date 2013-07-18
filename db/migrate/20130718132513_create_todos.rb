class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content
      t.integer :position
      t.integer :user_id
      t.string :completed
      t.string :boolean

      t.timestamps
    end
  end
end
