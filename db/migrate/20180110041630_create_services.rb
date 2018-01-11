class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.time :minimum_time
      t.time :maximum_time
      t.decimal :price

      t.timestamps
    end
  end
end
