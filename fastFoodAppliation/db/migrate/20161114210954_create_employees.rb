class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.integer :employee_id
      t.date :date_hired
      t.decimal :wage, precision: 8, scale: 2
      t.integer :person_id
      t.integer :postion_id
      t.integer :status_id

      t.timestamps
    end
  end
end
