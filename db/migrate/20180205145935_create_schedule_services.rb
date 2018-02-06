class CreateScheduleServices < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_services do |t|
      t.references :schedule, foreign_key: true
      t.references :salon, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
