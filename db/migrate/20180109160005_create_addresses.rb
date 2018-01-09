class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :cep
      t.references :state, foreign_key: true
      t.references :city, foreign_key: true
      t.references :district, foreign_key: true
      t.string :street
      t.string :number
      t.string :complement

      t.timestamps
    end
  end
end
