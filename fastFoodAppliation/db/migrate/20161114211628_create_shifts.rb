class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.integer :shift_id
      t.string :shift_time

      t.timestamps
    end
  end
end
