class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :item
      t.boolean :complete, :default => false
      t.string :details
      t.integer :priority, :default => 2

      t.timestamps
    end
  end
end
