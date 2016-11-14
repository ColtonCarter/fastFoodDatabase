class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_id
      t.datetime :invoice_time
      t.integer :employee_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
