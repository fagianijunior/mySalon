class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.references :gender, foreign_key: true
      t.datetime :birth_date
      t.string :cpf
      t.string :rg
      t.boolean :status, default: true
      t.text :notes

      t.timestamps
    end
  end
end
