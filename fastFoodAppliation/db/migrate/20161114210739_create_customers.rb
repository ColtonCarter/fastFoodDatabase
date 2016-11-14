class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.integer :customer_id
      t.integer :person_id

      t.timestamps
    end
  end
end
