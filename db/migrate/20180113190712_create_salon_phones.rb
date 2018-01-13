class CreateSalonPhones < ActiveRecord::Migration[5.1]
  def change
    create_table :salon_phones do |t|
      t.references :salon, foreign_key: true
      t.string :number
      t.boolean :telegram
      t.boolean :whatsapp

      t.timestamps
    end
  end
end
