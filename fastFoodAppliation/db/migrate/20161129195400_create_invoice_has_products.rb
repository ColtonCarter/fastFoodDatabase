class CreateInvoiceHasProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_has_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :product_quantity

      t.timestamps
    end
  end
end
