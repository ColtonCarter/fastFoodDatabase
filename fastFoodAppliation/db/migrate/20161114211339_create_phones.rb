class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.integer :phone_id
      t.string :phone_area_code
      t.string :phone_telephone_exchange
      t.string :phone_assigned_number
      t.integer :person_id

      t.timestamps
    end
  end
end
