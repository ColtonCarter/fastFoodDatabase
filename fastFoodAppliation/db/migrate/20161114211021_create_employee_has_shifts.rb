class CreateEmployeeHasShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_has_shifts do |t|
      t.integer :employee_id
      t.integer :shift_id

      t.timestamps
    end
  end
end
