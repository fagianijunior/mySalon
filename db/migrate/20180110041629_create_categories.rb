class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.boolean :has_size, default: false, null: false
      t.text :description

      t.timestamps
    end
  end
end
