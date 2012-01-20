class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    
    rename_column :tasks, :tags, :category_id
  end
end
