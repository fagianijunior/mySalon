class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.references :user, foreign_key: true
      t.string :nis

      t.timestamps
    end
  end
end
