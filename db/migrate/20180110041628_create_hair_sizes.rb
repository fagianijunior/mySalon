class CreateHairSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :hair_sizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
