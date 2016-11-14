class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.integer :email_id
      t.string :email_name

      t.timestamps
    end
  end
end
