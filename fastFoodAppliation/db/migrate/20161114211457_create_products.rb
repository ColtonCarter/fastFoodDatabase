class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :product_name
      t.string :product_description
      t.decimal :product_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
