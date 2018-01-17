class CreateEmployeeSalons < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_salons do |t|
      t.references :employee, foreign_key: true
      t.references :salon, foreign_key: true
      t.time :start_of_expedient
      t.time :start_lunch_time
      t.time :end_lunch_time
      t.time :end_of_expedient

      t.timestamps
    end
  end
end
