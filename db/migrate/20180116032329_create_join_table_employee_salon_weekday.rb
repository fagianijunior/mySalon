class CreateJoinTableEmployeeSalonWeekday < ActiveRecord::Migration[5.1]
  def change
    create_join_table :employee_salons, :weekdays do |t|
      # t.index [:employee_salon_id, :weekday_id]
      # t.index [:weekday_id, :employee_salon_id]
    end
  end
end
