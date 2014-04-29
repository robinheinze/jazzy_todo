class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :is_completed
    end
  end
end
