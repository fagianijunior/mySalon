class CreateEmployeeServices < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_services do |t|
      t.references :employee, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
