class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.integer :time
      t.text :description
      t.integer :tags

      t.timestamps
    end
  end
end
