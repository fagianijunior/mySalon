class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :icon
      t.references :category, foreign_key: true
      t.references :gender, foreign_key: true
      t.references :hair_size, foreign_key: true, null: true
      t.time :minimum_time
      t.time :maximum_time
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
