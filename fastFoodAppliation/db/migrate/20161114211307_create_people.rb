class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.integer :person_id
      t.string :person_first_name
      t.string :person_last_name

      t.timestamps
    end
  end
end
