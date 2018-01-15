class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.references :gender, foreign_key: true
      t.datetime :birth_date
      t.string :cpf
      t.string :rg
      t.boolean :ghost_role, default: false
      t.boolean :admin_role, default: false
      t.boolean :user_role, default: true
      t.boolean :active, default: true
      t.text :notes

      t.timestamps
    end
  end
end
