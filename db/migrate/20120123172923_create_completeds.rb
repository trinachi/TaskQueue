class CreateCompleteds < ActiveRecord::Migration
  def change
    create_table :completeds do |t|
      t.string :task
      t.integer :time
      t.string :description
      t.integer :category

      t.timestamps
    end
  end
end
